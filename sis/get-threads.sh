#!/bin/bash --login

rip-link.rb http://sis001.com/forum/forum-230-1.html 'tbody[id^="normalthread"] span a' > ,threads
rip-link.rb http://sis001.com/forum/forum-230-2.html 'tbody[id^="normalthread"] span a' >> ,threads
rip-link.rb http://sis001.com/forum/forum-230-3.html 'tbody[id^="normalthread"] span a' >> ,threads
rip-link.rb http://sis001.com/forum/forum-230-4.html 'tbody[id^="normalthread"] span a' >> ,threads
rip-link.rb http://sis001.com/forum/forum-230-1.html 'tbody[id^="normalthread"] span a' >> ,threads
