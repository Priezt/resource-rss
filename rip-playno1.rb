#!/usr/bin/env ruby

require 'open-uri'
require 'nokogiri'

page = Nokogiri::HTML(open('http://www.playno1.com/portal.php?mod=list&catid=4'))
page.css("div.fire_float h3 a").each do |a|
	puts "http://www.playno1.com/#{a.attr("href")}|#{a.text}"
end
