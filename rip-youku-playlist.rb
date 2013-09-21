#!/usr/bin/env ruby

require 'open-uri'

url = ARGV.shift

puts open(url).read().split(/[\r\n]+/).select{|l|
	l =~ /\bv_title\b/
}.map{|l|
	l =~ /href=\"([^"]+)\"[^>]*>([^<]+)</
	"#{$1}|#{$2}"
}.join "\n"
