#!/bin/bash --login

date

echo PATH=$PATH

WWW=$HOME/www/rss
FMR=/home/priezt/code/resource-rss/fresh-make-rss.sh

# yayaxz
yayaxz() { curl -s $1 | grep -A 5 resource-item | grep '<a href' | grep -v 'class="type"' | perl -pe 's/.*?>//;s/<.*//;' | perl -pe '$_ = "'$1'|".$_' | $FMR $2; }

#yayaxz http://www.yayaxz.com/resource/10733 GameOfThrones

# yyets
yyets() { w3m -dump -cols 500  $1 | grep '[ ]' | egrep 'mkv|rmvb|avi|mp4' | perl -pe 's/.* (1080P|720P|BD-720P|DVD|DVDSCR|HDTV|HR-HDTV|MP4|RMVB|WEB-DL)//' | perl -pe 's/(\.(?:mkv|rmvb|avi|mp4)).*/$1/' | perl -pe '$_ = "'$1'|".$_' | $FMR $2 ; }
yyets_rmvb_mp4() { w3m -dump -cols 500  $1 | grep '[ ]' | egrep 'rmvb|mp4' | perl -pe 's/.* (1080P|720P|BD-720P|DVD|DVDSCR|HDTV|HR-HDTV|MP4|RMVB|WEB-DL)//' | perl -pe 's/(\.(?:mkv|rmvb|avi|mp4)).*/$1/' | perl -pe '$_ = "'$1'|".$_' | $FMR $2 ; }

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
yyets http://www.yyets.com/php/resource/29316 GreenLantern
yyets_rmvb_mp4 http://www.yyets.com/php/resource/29311 Vikings
yyets_rmvb_mp4 http://www.yyets.com/php/resource/29326 Bible
yyets_rmvb_mp4 http://www.yyets.com/resource/10733 GameOfThrones
yyets_rmvb_mp4 http://www.yyets.com/resource/28404 DaVincisDemons
yyets_rmvb_mp4 http://www.yyets.com/resource/28764 Hannibal
yyets_rmvb_mp4 http://www.yyets.com/resource/29725 Galileo
yyets_rmvb_mp4 http://www.yyets.com/resource/29676 Defiance
#yyets http://www.yyets.com/resource/26326 DoctorWho
yyets_rmvb_mp4 http://www.yyets.com/resource/29752 MinnaEsupaDayo
yyets_rmvb_mp4 http://www.yyets.com/resource/26790 AngerManagement
#yyets_rmvb_mp4 http://www.yyets.com/resource/11112 TEN
yyets_rmvb_mp4 http://www.yyets.com/resource/30010 AvengersAssemble
yyets_rmvb_mp4 http://www.yyets.com/resource/30025 UnderTheDome
yyets_rmvb_mp4 http://www.yyets.com/resource/30347 BewareTheBatman
yyets_rmvb_mp4 http://www.yyets.com/resource/30369 Akuryo
yyets_rmvb_mp4 http://www.yyets.com/resource/30438 SenzyoTanteiKageyama


pq-rip.py -u 'http://www.yyets.com/' 'div.top24hours ul li a' | $FMR YYeTsHome

# movie
pq-rip.py -u 'http://www.piaohua.com' 'a > strong > font' | $FMR PiaoHua

# tudou

curl -s http://www.tudou.com/albumcover/tu2_3AhegUY.html | iconv -f GBK -t UTF-8 | grep -i albumplay | grep target | grep -v '></a' | sed '1,3d' | sed 's/^.*" href="//' | sed 's/"./\|/' | sed 's/<\/a>.*$//' | $FMR Gintama

# youku

pq-rip.py -u 'http://www.youku.com/show_page/id_z02baa1f0cbcf11e19013.html' 'div#episode ul li a' | $FMR 10000ColdJokes

# bilibili

get-rendered-url.js 'http://www.bilibili.tv/sp/JOJO%E7%9A%84%E5%A5%87%E5%A6%99%E5%86%92%E9%99%A9' | pq-rip.py -u -s 'http://www.bilibili.tv/sp/JOJO%E7%9A%84%E5%A5%87%E5%A6%99%E5%86%92%E9%99%A9' 'div#bgm_video_container div.t' | $FMR JoJoAnime

curl -s http://space.bilibili.tv/12276 | zcat | pq-rip.py -u -s http://space.bilibili.tv/12276 'a.title' | $FMR Zexal

# Diablo3 GongLue
curl -s 'http://www.ali213.net/zt/diablo3/gl/' | sed '1,/zhongjleft/d' | grep li | sed 's/.*<a/<a/' | sed 's/<'\\'/a>.*/<'\\'/a>/' | grep '<a' | grep 'class="b"' | iconv -f GB2312 -t UTF-8 | sed 's/.*href="//' | perl -ple 's/" class="b"[^>]*>/|/' | sed 's/<'\\'/a.*//' | $FMR Diablo3GongLue


# 3DM

pq-rip.py -u http://dl.3dmgame.com/ 'div.YiClist ul li p a' | $FMR 3DMDownload


# Kindegarden

pq-rip.py -u 'http://www.chneic.sh.cn/manager/news/more/more.asp?id=2' "table[width='745'] tr td a" | $FMR ChangNingEducation
pq-rip.py -u 'http://www.chneic.sh.cn/manager/news/more/more.asp?id=260' "table[width='745'] tr td a" | $FMR ChangNingEducationZhaoShen

# Letv

letv() { w3m -dump -cols 500  $1 | pcregrep '\s\d\d:\d\d\s*$' | perl -pe '$_ = "'$1'|".$_' | $FMR $2 ; }
letv http://so.letv.com/comic/88310.html Garo3

# FRTVS

pq-rip.py -u http://www.1000fr.net/thread-389512-1-2.html 'div.postattachlist dl.t_attachlist dt a[href*=attachpage]' | $FMR DoctorWhoS07

# 2tu.cc

tucc() { pq-rip.py $1 'div#main div.sections ul.pdown li a' | perl -pe '$_ = "'$1'|".$_' | $FMR $2; }
tucc http://www.2tu.cc/Html/GP15182.html Garo3-2tu

# yinxun

pq-rip.py -u http://www.verycd.com/theater 'ul.cf li' | $FMR YinXun

echo ======================================
