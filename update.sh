#!/bin/bash --login

date

echo PATH=$PATH

WWW=$HOME/www/rss
FMR=/home/priezt/code/resource-rss/fresh-make-rss.sh

cd /home/priezt/code/resource-rss

# tieba

#tieba(){ curl -s $1 | tr '<' '\n' | grep j_th_tit | grep href | grep ^a | grep /p/ | sed 's/.*href="/http:\/\/tieba.baidu.com/' | perl -pe 's/".*>/\|/' | iconv -f GBK -t UTF-8 | $FMR $2; }
tieba(){ curl -s $1 | tr '<' '\n' | grep j_th_tit | grep href | grep ^a | grep /p/ | sed 's/.*href="/http:\/\/tieba.baidu.com/' | perl -pe 's/".*>/\|/' | $FMR $2; }

#tieba http://tieba.baidu.com/f?kw=%C2%AF%CA%AF%B4%AB%CB%B5 HearthStoneTieba
tieba 'http://tieba.baidu.com/f/good?kw=%C2%AF%CA%AF%B4%AB%CB%B5' HearthStoneTieba

tieba 'http://tieba.baidu.com/f/good?kw=%BF%D6%B2%C0%C6%AC' KongBuPianTieba

# yayaxz
yayaxz() { curl -s $1 | grep -A 5 resource-item | grep -v 'class="type"' | grep -A 1 '<a href' | grep -v '<a href' | grep '\.' | perl -pe '$_ = "'$1'|".$_' | $FMR $2; }
#yayaxz() { ng-rip.rb $1 'dd.resource-item > a:not([class])' | perl -pe '$_ = "'$1'|".$_' | $FMR $2; }


# yyets
yyets() { w3m -dump -cols 500  $1 | grep '[ ]' | egrep 'mkv|rmvb|avi|mp4' | perl -pe 's/.* (1080P|720P|BD-720P|DVD|DVDSCR|HDTV|HR-HDTV|MP4|RMVB|WEB-DL)//' | perl -pe 's/(\.(?:mkv|rmvb|avi|mp4)).*/$1/' | perl -pe '$_ = "'$1'|".$_' | $FMR $2 ; }
yyets_rmvb_mp4() { w3m -dump -cols 500  $1 | grep '[ ]' | egrep 'rmvb|mp4' | perl -pe 's/.* (1080P|720P|BD-720P|DVD|DVDSCR|HDTV|HR-HDTV|MP4|RMVB|WEB-DL)//' | perl -pe 's/(\.(?:mkv|rmvb|avi|mp4)).*/$1/' | perl -pe '$_ = "'$1'|".$_' | $FMR $2 ; }

yyets_rmvb_mp4 http://www.yyets.com/resource/11015 Supernatural
yyets_rmvb_mp4 http://www.yyets.com/resource/11005 TBBT
yyets_rmvb_mp4 http://www.yyets.com/resource/26779 Arrow
yyets_rmvb_mp4 http://www.yyets.com/resource/11057 TheWalkingDead
yyets_rmvb_mp4 http://www.yyets.com/resource/11007 Mentalist
yyets_rmvb_mp4 http://www.yyets.com/resource/10990 TwoAndAHalfMen
yyets_rmvb_mp4 http://www.yyets.com/resource/28235 BlackMirror
yyets_rmvb_mp4 http://www.yyets.com/resource/10733 GameOfThrones
yyets_rmvb_mp4 http://www.yyets.com/resource/29725 Galileo
yyets_rmvb_mp4 http://www.yyets.com/resource/30010 AvengersAssemble
yyets_rmvb_mp4 http://www.yyets.com/resource/30509 HulkAndTheAgentsOfSmash
yyets_rmvb_mp4 http://www.yyets.com/resource/30330 SleepyHollow
yyets_rmvb_mp4 http://www.yyets.com/resource/30675 SHIELD
yyets_rmvb_mp4 http://www.yyets.com/resource/30227 AlmostHuman
yyets_rmvb_mp4 http://www.yyets.com/resource/11049 AmericanHorrorStory
yyets_rmvb_mp4 http://www.yyets.com/resource/11133 Sherlock
yyets_rmvb_mp4 http://www.yyets.com/resource/31088 Helix
yyets_rmvb_mp4 http://www.yyets.com/resource/10682 Ushijimakun
yyets_rmvb_mp4 http://www.yyets.com/resource/31801 SiliconValley
yyets_rmvb_mp4 http://www.yyets.com/resource/32235 TheFlash
yyets_rmvb_mp4 http://www.yyets.com/resource/32264 Constantine
yyets_rmvb_mp4 http://www.yyets.com/resource/32143 Extant
yyets_rmvb_mp4 http://www.yyets.com/resource/32102 TheStrain
yyets_rmvb_mp4 http://www.yyets.com/resource/26326 DoctorWho
yyets_rmvb_mp4 http://www.yyets.com/resource/32725 ZNation

yayaxz http://www.yayaxz.com/resource/11015 yayaSupernatural
yayaxz http://www.yayaxz.com/resource/11005 yayaTBBT
yayaxz http://www.yayaxz.com/resource/26779 yayaArrow
yayaxz http://www.yayaxz.com/resource/11057 yayaTheWalkingDead
yayaxz http://www.yayaxz.com/resource/11007 yayaMentalist
yayaxz http://www.yayaxz.com/resource/10990 yayaTwoAndAHalfMen
yayaxz http://www.yayaxz.com/resource/28235 yayaBlackMirror
yayaxz http://www.yayaxz.com/resource/10733 yayaGameOfThrones
yayaxz http://www.yayaxz.com/resource/29725 yayaGalileo
yayaxz http://www.yayaxz.com/resource/30010 yayaAvengersAssemble
yayaxz http://www.yayaxz.com/resource/30509 yayaHulkAndTheAgentsOfSmash
yayaxz http://www.yayaxz.com/resource/30330 yayaSleepyHollow
yayaxz http://www.yayaxz.com/resource/30675 yayaSHIELD
yayaxz http://www.yayaxz.com/resource/30227 yayaAlmostHuman
yayaxz http://www.yayaxz.com/resource/11049 yayaAmericanHorrorStory
yayaxz http://www.yayaxz.com/resource/11133 yayaSherlock
yayaxz http://www.yayaxz.com/resource/31088 yayaHelix
yayaxz http://www.yayaxz.com/resource/10682 yayaUshijimakun
yayaxz http://www.yayaxz.com/resource/31801 yayaSiliconValley
yayaxz http://www.yayaxz.com/resource/32235 yayaTheFlash
yayaxz http://www.yayaxz.com/resource/32264 yayaConstantine
yayaxz http://www.yayaxz.com/resource/32143 yayaExtant
yayaxz http://www.yayaxz.com/resource/32102 yayaTheStrain
yayaxz http://www.yayaxz.com/resource/26326 yayaDoctorWho
yayaxz http://www.yayaxz.com/resource/32725 yayaZNation

#yayaxz http://www.yayaxz.com/resource/26753 yayaAvengersS02
#yayaxz http://www.yayaxz.com/resource/26745 yayaTron
#yayaxz http://www.yayaxz.com/resource/26737 yayaUltimateSpiderMan
#yayaxz http://www.yayaxz.com/resource/11015 yayaSupernatural
#yayaxz http://www.yayaxz.com/resource/11005 yayaTBBT
#yayaxz http://www.yayaxz.com/resource/26779 yayaArrow
#yayaxz http://www.yayaxz.com/resource/11057 yayaTheWalkingDead
#yayaxz http://www.yayaxz.com/resource/11007 yayaMentalist
#yayaxz http://www.yayaxz.com/resource/10990 yayaTwoAndAHalfMen
#yayaxz http://www.yayaxz.com/resource/28793 yayaHouseOfCards
#yayaxz http://www.yayaxz.com/resource/11103 yaya2BrokeGirls
#yayaxz http://www.yayaxz.com/resource/28235 yayaBlackMirror
#yayaxz http://www.yayaxz.com/resource/10452 yayaArcher
#yayaxz http://www.yayaxz.com/resource/10733 yayaGameOfThrones
#yayaxz http://www.yayaxz.com/resource/29725 yayaGalileo
#yayaxz http://www.yayaxz.com/resource/26790 yayaAngerManagement
#yayaxz http://www.yayaxz.com/resource/30010 yayaAvengersAssemble
#yayaxz http://www.yayaxz.com/resource/30347 yayaBewareTheBatman
#yayaxz http://www.yayaxz.com/resource/30509 yayaHulkAndTheAgentsOfSmash
#yayaxz http://www.yayaxz.com/resource/30330 yayaSleepyHollow
#yayaxz http://www.yayaxz.com/resource/30675 yayaSHIELD
#yayaxz http://www.yayaxz.com/resource/30616 yayaAtlantis
#yayaxz http://www.yayaxz.com/resource/30032 yayaTheTomorrowPeople
#yayaxz http://www.yayaxz.com/resource/30883 yayaAndoroido
#yayaxz http://www.yayaxz.com/resource/29984 yayaChosen
#yayaxz http://www.yayaxz.com/resource/30227 yayaAlmostHuman

pq-rip.py -u 'http://www.yyets.com/' 'div.top24hours ul li a' | $FMR YYeTsHome

# movie
#pq-rip.py -u 'http://www.piaohua.com' 'a > strong > font' | $FMR PiaoHua
j.rip http://www.piaohua.com/ 'div#im li' 'strong' | ./jrrs.sh PiaoHua

# iqiyi

#j.rip http://www.iqiyi.com/a_19rrhbkchh.html '#j-pagelist-content ul li' 'p a' | ./jrrs.sh HuaJiangHu
j.rip http://www.iqiyi.com/a_19rrhbkchh.html 'div.mod_album_lists ul li.album_item'| ./jrrs.sh HuaJiangHu

# tudou

curl -s http://www.tudou.com/albumcover/tu2_3AhegUY.html | iconv -f GBK -t UTF-8 | grep -i albumplay | grep target | grep -v '></a' | sed '1,3d' | sed 's/^.*" href="//' | sed 's/"./\|/' | sed 's/<\/a>.*$//' | $FMR Gintama

# youku

#pq-rip.py -u 'http://www.youku.com/show_page/id_z02baa1f0cbcf11e19013.html' 'div#episode ul li a' | $FMR 10000ColdJokes
#pq-rip.py -u 'http://www.youku.com/show_page/id_zd1d065eafb1411e2a705.html' 'div#episode ul li a' | $FMR WanWanMeiXiangDao

#./rip-youku-playlist.rb http://www.youku.com/playlist_show/id_20034870.html | $FMR MeiWanYiGeGuiGuShi

# bilibili

#get-rendered-url.js 'http://www.bilibili.tv/sp/JOJO%E7%9A%84%E5%A5%87%E5%A6%99%E5%86%92%E9%99%A9' | pq-rip.py -u -s 'http://www.bilibili.tv/sp/JOJO%E7%9A%84%E5%A5%87%E5%A6%99%E5%86%92%E9%99%A9' 'div#bgm_video_container div.t' | $FMR JoJoAnime

curl -s http://space.bilibili.tv/12276 | zcat | pq-rip.py -u -s http://space.bilibili.tv/12276 'a.title' | $FMR Zexal

curl -s http://www.bilibili.tv/sppage/bangumi-16497-1.html | sed '1i\\n' | sed '1r utf8-header.html' | pq-rip.py -u -s http://www.bilibili.tv/sppage/bangumi-16497-1.html 'a' | perl -pe '$_="http://www.bilibili.tv".$_' | $FMR SaiBangChou

curl -s http://bilibili.kankanews.com/sppage/bangumi-6634-893-1.html | sed '1i\\n' | sed '1r utf8-header.html' | pq-rip.py -u -s http://bilibili.kankanews.com/sppage/bangumi-6634-893-1.html 'a' | perl -pe '$_="http://www.bilibili.tv".$_' | $FMR JoJo3Anime

curl -s http://bilibili.kankanews.com/sppage/bangumi-5636-901-1.html | sed '1i\\n' | sed '1r utf8-header.html' | pq-rip.py -u -s http://bilibili.kankanews.com/sppage/bangumi-5636-901-1.html 'a' | perl -pe '$_="http://www.bilibili.tv".$_' | $FMR ARCV

curl -s http://bilibili.kankanews.com/sppage/bangumi-1596-891-1.html | sed '1i\\n' | sed '1r utf8-header.html' | pq-rip.py -u -s http://bilibili.kankanews.com/sppage/bangumi-1596-891-1.html 'a' | perl -pe '$_="http://www.bilibili.tv".$_' | $FMR Mushishi2

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


# yinxun

pq-rip.py -u http://www.verycd.com/theater 'ul.cf li' | $FMR YinXun

# dwango
ng-rip.rb 'http://pc.dwango.jp/rankings/single/monthly' '#ranking table td div.rightname' | $FMR JPOP
ng-rip.rb 'http://pc.dwango.jp/rankings/single/monthly/genre:kpop' '#ranking table td div.rightname' | $FMR KPOP

# BN

#ng-rip.rb http://www.hearthstone.com.cn/home 'a.homeNewsItem' | $FMR HearthStoneBNNews
j.rip http://www.hearthstone.com.cn/home 'div.homeNewsWrap' 'h4' | ./jrrs.sh HearthStoneBNNews

#ng-rip.rb -u http://h.163.com/ <(curl -s http://h.163.com/ | iconv -f GBK -t UTF-8) '#hotlist h2.blog-title a' | $FMR HearthStone163News
j.rip -u http://h.163.com/ <(curl -s http://h.163.com/ | iconv -f GBK -t UTF-8) 'div.blog-news' 'a' | ./jrrs.sh HearthStone163News

j.rip 'http://dv.56.com/funny/?do=review' 'div.review_list li' 'div.vid_info' | ./jrrs.sh WeiBoJiangHu

j.rip http://bt.ktxp.com/team-222-1.html 'td.ttitle' 'a:eq(2)' 'a:eq(2)' | ./jrrs.sh KRL

j.rip 'http://bt.ktxp.com/search.php?keyword=JOJO%E5%A5%87%E5%A6%99%E5%86%92%E9%99%A9%E5%90%A7' 'td.ttitle' 'a:eq(2)' 'a:eq(2)' | ./jrrs.sh JoJo3KTXP

j.rip 'http://bt.ktxp.com/search.php?keyword=%E6%B8%B8%E6%88%8F%E7%8E%8B' 'td.ttitle' 'a:eq(2)' 'a:eq(2)' | ./jrrs.sh YuGiOh_ARCV_KTXP

j.rip 'http://bt.ktxp.com/search.php?keyword=%E7%81%AB%E6%98%9F%E5%BC%82%E7%A7%8D' 'td.ttitle' 'a:eq(2)' 'a:eq(2)' | ./jrrs.sh TerraFormars_KTXP

j.rip 'http://bt.ktxp.com/search.php?keyword=%E5%AF%84%E7%94%9F%E5%85%BD' 'td.ttitle' 'a:eq(2)' 'a:eq(2)' | ./jrrs.sh Kiseijuu_KTXP

j.rip http://www.chinaocg.cn/ 'div.items' 'a' | ./jrrs.sh CHINAOCG

j.rip 'http://book.douban.com/latest?icn=index-latestbook-all' 'div.article ul li:not([class*=clear])' 'div.detail-frame h2' 'a' |  ./jrrs.sh DoubanNewBookFiction

j.rip 'http://book.douban.com/latest?icn=index-latestbook-all' 'div.aside ul li:not([class*=clear])' 'div.detail-frame h2' 'a' |  ./jrrs.sh DoubanNewBookReal

j.rip 'http://kr.hujiang.com/new/tag/%E9%9F%A9%E8%AF%AD%E6%AF%8F%E6%97%A5%E4%B8%80%E5%8F%A5/' 'ul#article_list li' 'a.a_article_title' 'a.a_article_title' | head | ./jrrs.sh KoreanMeiRiYiJu

ng-rip.rb http://bt.ktxp.com/playbill.php 'div.item-box div.container dl dd a' | $FMR KTXP_JieMuDan

date
echo ======================================
