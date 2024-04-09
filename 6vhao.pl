#!/usr/bin/env perl

use Data::Dumper;
use JSON;

open HTML, "curl -s -L http://www.6vhao.tv/ | pup 'div.tjlist ul li' |";
while(<HTML>){
	chomp;
	next unless /<a href="([^"]+)" title="([^"]+)"/;
	push @result, {
		url => "http://www.6vhao.tv".$1,
		title => $2,
	};
}
close HTML;

@result = @result[0..9];
open RSS, "| ./json2rss.py 6vhao > /tmp/6vhao.xml";
print RSS to_json(\@result);
close RSS;

system("scp /tmp/6vhao.xml cuckoo\@10.21.254.12:/data/backup/maldun-static-assets/rss/6vhao.xml");
