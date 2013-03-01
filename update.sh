#!/bin/bash --login

date

echo PATH=$PATH

WWW=$HOME/www/rss
FMR=/home/priezt/code/resource-rss/fresh-make-rss.sh

# comic
#pq-rip.py -u 'http://www.dm5.com/manhua-huofengliaoyuan/' '#cbc_1 > li > a' | grep -v javascript | $FMR HuoFeng
#pq-rip.py -u 'http://www.dm5.com/manhua-qizhayouxi/' '#cbc_1 > li > a' | grep -v javascript | $FMR LiarGame
#pq-rip.py -u 'http://www.dm5.com/manhua-jinjidejuren/' '#cbc_1 > li > a' | grep -v javascript | $FMR Giant
#pq-rip.py -u 'http://www.dm5.com/manhua-jojo-qimiaomaoxiandi-08-bu/' '#cbc_1 > li > a' | grep -v javascript | $FMR JoJo8
#pq-rip.py -u 'http://www.dm5.com/manhua-fengshenji-2/' '#cbc_1 > li > a' | grep -v javascript | $FMR FengShenJi2

# movie
#pq-rip.py -u 'http://www.piaohua.com' 'a > strong > font' | $FMR PiaoHua

# yyets
echo YYETS
#YYETS_TEMP=/tmp/,yyets
#
#pq-rip.py -u 'http://www.yyets.com/html/today.html' 'tr.list > td > a[href*="php/resource"]' > $YYETS_TEMP
#
#cat $YYETS_TEMP | grep 'Ultimate.Spider-Man' | $FMR UltimateSpiderMan
#cat $YYETS_TEMP | grep 'The Avengers - Earth' | $FMR AvengersS02
#cat $YYETS_TEMP | grep 'Tron.Uprising' | $FMR Tron
#cat $YYETS_TEMP | grep -i 'Suits.S02' | $FMR SuitsS02
#cat $YYETS_TEMP | grep -i 'Higashinokeigo.Misuterizu' | $FMR HigashinokeigoMisuterizu
#cat $YYETS_TEMP | grep -i 'Merlin' | $FMR Merlin
#cat $YYETS_TEMP | grep -i 'Big.Bang' | $FMR TBBT
#cat $YYETS_TEMP | grep -i 'Supernatural' | $FMR Supernatural
#cat $YYETS_TEMP | grep -i 'Fringe' | $FMR Fringe

yyets() { get-rendered-url.js $1 | pq-rip.py -u -s $1 'ul.resod_list li span.l a span.a' | $FMR $2 ; }
yyets_rmvb_mp4() { get-rendered-url.js $1 | pq-rip.py -u -s $1 'ul.resod_list li span.l a span.a' | egrep -i 'rmvb|mp4' | $FMR $2 ; }

yyets_rmvb_mp4 http://www.yyets.com/php/resource/26753 AvengersS02
yyets_rmvb_mp4 http://www.yyets.com/php/resource/26745 Tron
yyets_rmvb_mp4 http://www.yyets.com/php/resource/26737 UltimateSpiderMan
yyets http://www.yyets.com/php/resource/29024 UltraQ
yyets_rmvb_mp4 http://www.yyets.com/php/resource/10910 SuitsS02
yyets_rmvb_mp4 http://www.yyets.com/php/resource/11013 Fringe
yyets_rmvb_mp4 http://www.yyets.com/php/resource/11037 Merlin
yyets_rmvb_mp4 http://www.yyets.com/php/resource/11015 Supernatural
yyets_rmvb_mp4 http://www.yyets.com/php/resource/11005 TBBT
yyets_rmvb_mp4 http://www.yyets.com/php/resource/26779 Arrow
yyets_rmvb_mp4 http://www.yyets.com/php/resource/11057 TheWalkingDead
yyets_rmvb_mp4 http://www.yyets.com/php/resource/11007 Mentalist
yyets_rmvb_mp4 http://www.yyets.com/php/resource/26195 Dexter
yyets_rmvb_mp4 http://www.yyets.com/php/resource/10990 TwoAndAHalfMen
yyets_rmvb_mp4 http://www.yyets.com/php/resource/11176 Spartacus
yyets_rmvb_mp4 http://www.yyets.com/php/resource/28793 HouseOfCards
yyets http://www.yyets.com/php/resource/29134 NeoUltraQ
yyets_rmvb_mp4 http://www.yyets.com/php/resource/11103 2BrokeGirls
yyets_rmvb_mp4 http://www.yyets.com/php/resource/28235 BlackMirror
yyets http://www.yyets.com/php/resource/10452 Archer

# Below: not interesting any more

#yyets_rmvb http://www.yyets.com/php/resource/27156 666ParkAvenue
#yyets http://www.yyets.com/php/resource/27274 BeautyAndTheBeast
#yyets http://www.yyets.com/php/resource/11049 AmericanHorrorStory
#yyets http://www.yyets.com/php/resource/11030 Boardwalk

get-rendered-url.js 'http://www.bilibili.tv/sp/JOJO%E7%9A%84%E5%A5%87%E5%A6%99%E5%86%92%E9%99%A9' | pq-rip.py -u -s 'http://www.bilibili.tv/sp/JOJO%E7%9A%84%E5%A5%87%E5%A6%99%E5%86%92%E9%99%A9' 'div#bgm_video_container div.t' | $FMR JoJoAnime


#get-rendered-url.js http://www.yyets.com/php/resource/26753 | pq-rip.py -u -s http://www.yyets.com/php/resource/26753 'ul.resod_list li span.l a span.a' | $FMR AvengersS02
#get-rendered-url.js http://www.yyets.com/php/resource/10910 | pq-rip.py -u -s http://www.yyets.com/php/resource/10910 'ul.resod_list li span.l a span.a' | $FMR SuitsS02
#get-rendered-url.js http://www.yyets.com/php/resource/26745 | pq-rip.py -u -s http://www.yyets.com/php/resource/26745 'ul.resod_list li span.l a span.a' | $FMR Tron
#get-rendered-url.js http://www.yyets.com/php/resource/26737 | pq-rip.py -u -s http://www.yyets.com/php/resource/26737 'ul.resod_list li span.l a span.a' | $FMR UltimateSpiderMan
#get-rendered-url.js http://www.yyets.com/php/resource/11013 | pq-rip.py -u -s http://www.yyets.com/php/resource/11013 'ul.resod_list li span.l a span.a' | $FMR Fringe
#get-rendered-url.js http://www.yyets.com/php/resource/11037 | pq-rip.py -u -s http://www.yyets.com/php/resource/11037 'ul.resod_list li span.l a span.a' | $FMR Merlin
#get-rendered-url.js http://www.yyets.com/php/resource/11015 | pq-rip.py -u -s http://www.yyets.com/php/resource/11015 'ul.resod_list li span.l a span.a' | $FMR Supernatural
#get-rendered-url.js http://www.yyets.com/php/resource/11005 | pq-rip.py -u -s http://www.yyets.com/php/resource/11005 'ul.resod_list li span.l a span.a' | $FMR TBBT
#get-rendered-url.js http://www.yyets.com/php/resource/26779 | pq-rip.py -u -s http://www.yyets.com/php/resource/26779 'ul.resod_list li span.l a span.a' | $FMR Arrow
#get-rendered-url.js http://www.yyets.com/php/resource/11049 | pq-rip.py -u -s http://www.yyets.com/php/resource/11049 'ul.resod_list li span.l a span.a' | $FMR AmericanHorrorStory
#get-rendered-url.js http://www.yyets.com/php/resource/11057 | pq-rip.py -u -s http://www.yyets.com/php/resource/11057 'ul.resod_list li span.l a span.a' | $FMR TheWalkingDead

# tianya
#pq-rip.py -u 'http://www.tianya.cn/new/techforum/articleslist.asp?iditem=14&strpart=%D7%EE%D0%C2%B7%A2%B1%ED&part=1' 'div#postlistwrapper table td.posttitle a' | $FMR TianYa-KaiXinLeYuan

# Diablo3 GongLue
curl -s 'http://www.ali213.net/zt/diablo3/gl/' | sed '1,/zhongjleft/d' | grep li | sed 's/.*<a/<a/' | sed 's/<'\\'/a>.*/<'\\'/a>/' | grep '<a' | grep 'class="b"' | iconv -f GB2312 -t UTF-8 | sed 's/.*href="//' | perl -ple 's/" class="b"[^>]*>/|/' | sed 's/<'\\'/a.*//' | $FMR Diablo3GongLue

curl -s http://space.bilibili.tv/12276 | zcat | pq-rip.py -u -s http://space.bilibili.tv/12276 'a.title' | $FMR Zexal

echo ======================================
