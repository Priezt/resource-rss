#!/usr/bin/env perl

use JSON;

$url = shift @ARGV or die 'need url';

$url =~ /\/thread-(\d+)-/;
$id = $1;

print "Get: $url\n";

$attachment_url = `rip-link.rb $url 'a[href^="attachment.php"]' | head -1`;

@images = map {chomp; $_} `rip-img.rb $url 'td.postcontent div.postmessage img[onload]'`;

$description = `rip-text.rb $url 'td.postcontent' | head -1`;

$path = "threads/".$id;
mkdir $path;

# download attachment

system("curl -s '$attachment_url' > $path/seed.torrent");

# download images

$count = 1;
for my $img (@images){
	my $img_fn = $img;
	$img_fn =~s /.*\///;
	$img_fn =~s /^.+\.(\w+)$/$count.".".$1/e;
	push @img_filenames, $img_fn;
	system("curl -s '$img' > $path/$img_fn");
	$count++;
}

# write html

open HTML,">",$path."/index.html";
print HTML "<div class=\"thread\">\n";
print HTML $description."<br>\n";
for my $img (@img_filenames){
	print HTML "<img src=\"threads/$id/$img\"><br>\n";
}
print HTML "<h1><a href=\"threads/$id/seed.torrent\">Torrent</a><br>\n</h1>";
print HTML "</div>\n";
print HTML "<hr>\n";
close HTML;
