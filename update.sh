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
#tieba 'http://tieba.baidu.com/f/good?kw=%C2%AF%CA%AF%B4%AB%CB%B5' HearthStoneTieba

#tieba 'http://tieba.baidu.com/f/good?kw=%BF%D6%B2%C0%C6%AC' KongBuPianTieba

# yayaxz
yayaxz() { curl -s $1 | grep -A 5 resource-item | grep -v 'class="type"' | grep -A 1 '<a href' | grep -v '<a href' | grep '\.' | perl -pe '$_ = "'$1'|".$_' | $FMR $2; }
#yayaxz() { ng-rip.rb $1 'dd.resource-item > a:not([class])' | perl -pe '$_ = "'$1'|".$_' | $FMR $2; }


# yyets
yyets() { w3m -dump -cols 500  $1 | grep '[ ]' | egrep 'mkv|rmvb|avi|mp4' | perl -pe 's/.* (1080P|720P|BD-720P|DVD|DVDSCR|HDTV|HR-HDTV|MP4|RMVB|WEB-DL)//' | perl -pe 's/(\.(?:mkv|rmvb|avi|mp4)).*/$1/' | perl -pe '$_ = "'$1'|".$_' | $FMR $2 ; }
yyets_rmvb_mp4() { w3m -dump -cols 500  $1 | grep '[ ]' | egrep 'rmvb|mp4' | perl -pe 's/.* (1080P|720P|BD-720P|DVD|DVDSCR|HDTV|HR-HDTV|MP4|RMVB|WEB-DL)//' | perl -pe 's/(\.(?:mkv|rmvb|avi|mp4)).*/$1/' | perl -pe '$_ = "'$1'|".$_' | $FMR $2 ; }

get_yyets() { yyets_rmvb_mp4 http://www.meihaodeyitian.com/file/$1 $2 ; }
#get_yyets() { yyets_rmvb_mp4 http://www.mhxz001.com/file/$1 $2 ; }
#get_yyets() { yyets_rmvb_mp4 http://www.mhxz002.com/file/$1 $2 ; }
#get_yyets() { yyets_rmvb_mp4 http://www.rrys123.com/resource/$1 $2 ; }
# exp: get_yyets 11015 Supernatural

#pq-rip.py -u 'http://www.yyets.com/' 'div.top24hours ul li a' | $FMR YYeTsHome

# movie
#pq-rip.py -u 'http://www.piaohua.com' 'a > strong > font' | $FMR PiaoHua
j.rip http://www.piaohua.com/ 'div#im li' 'strong' | ./jrrs.sh PiaoHua

# iqiyi

#j.rip http://www.iqiyi.com/a_19rrhbkchh.html '#j-pagelist-content ul li' 'p a' | ./jrrs.sh HuaJiangHu
j.rip http://www.iqiyi.com/a_19rrhbkchh.html 'div.mod_album_lists ul li.album_item'| ./jrrs.sh HuaJiangHu

# tudou

#curl -s http://www.tudou.com/albumcover/tu2_3AhegUY.html | iconv -f GBK -t UTF-8 | grep -i albumplay | grep target | grep -v '></a' | sed '1,3d' | sed 's/^.*" href="//' | sed 's/"./\|/' | sed 's/<\/a>.*$//' | $FMR Gintama

# youku

#pq-rip.py -u 'http://www.youku.com/show_page/id_z02baa1f0cbcf11e19013.html' 'div#episode ul li a' | $FMR 10000ColdJokes
#pq-rip.py -u 'http://www.youku.com/show_page/id_zd1d065eafb1411e2a705.html' 'div#episode ul li a' | $FMR WanWanMeiXiangDao

#./rip-youku-playlist.rb http://www.youku.com/playlist_show/id_20034870.html | $FMR MeiWanYiGeGuiGuShi

# bilibili

#get-rendered-url.js 'http://www.bilibili.tv/sp/JOJO%E7%9A%84%E5%A5%87%E5%A6%99%E5%86%92%E9%99%A9' | pq-rip.py -u -s 'http://www.bilibili.tv/sp/JOJO%E7%9A%84%E5%A5%87%E5%A6%99%E5%86%92%E9%99%A9' 'div#bgm_video_container div.t' | $FMR JoJoAnime

#curl -s http://bilibili.kankanews.com/sppage/bangumi-5636-901-1.html | sed '1i\\n' | sed '1r utf8-header.html' | pq-rip.py -u -s http://bilibili.kankanews.com/sppage/bangumi-5636-901-1.html 'a' | perl -pe '$_="http://www.bilibili.tv".$_' | $FMR ARCV

# Diablo3 GongLue
#curl -s 'http://www.ali213.net/zt/diablo3/gl/' | sed '1,/zhongjleft/d' | grep li | sed 's/.*<a/<a/' | sed 's/<'\\'/a>.*/<'\\'/a>/' | grep '<a' | grep 'class="b"' | iconv -f GB2312 -t UTF-8 | sed 's/.*href="//' | perl -ple 's/" class="b"[^>]*>/|/' | sed 's/<'\\'/a.*//' | $FMR Diablo3GongLue


# 3DM

#pq-rip.py -u http://dl.3dmgame.com/ 'div.YiClist ul li p a' | $FMR 3DMDownload


# Kindegarden

#pq-rip.py -u 'http://www.chneic.sh.cn/manager/news/more/more.asp?id=2' "table[width='745'] tr td a" | $FMR ChangNingEducation
#pq-rip.py -u 'http://www.chneic.sh.cn/manager/news/more/more.asp?id=260' "table[width='745'] tr td a" | $FMR ChangNingEducationZhaoShen

# Letv

#letv() { w3m -dump -cols 500  $1 | pcregrep '\s\d\d:\d\d\s*$' | perl -pe '$_ = "'$1'|".$_' | $FMR $2 ; }
letv http://so.letv.com/comic/88310.html Garo3

# FRTVS

pq-rip.py -u http://www.1000fr.net/thread-389512-1-2.html 'div.postattachlist dl.t_attachlist dt a[href*=attachpage]' | $FMR DoctorWhoS07

# 2tu.cc

tucc() { pq-rip.py $1 'div#main div.sections ul.pdown li a' | perl -pe '$_ = "'$1'|".$_' | $FMR $2; }


# yinxun

#pq-rip.py -u http://www.verycd.com/theater 'ul.cf li' | $FMR YinXun

# dwango
#ng-rip.rb 'http://pc.dwango.jp/rankings/single/monthly' '#ranking table td div.rightname' | $FMR JPOP
#ng-rip.rb 'http://pc.dwango.jp/rankings/single/monthly/genre:kpop' '#ranking table td div.rightname' | $FMR KPOP

# BN

#ng-rip.rb http://www.hearthstone.com.cn/home 'a.homeNewsItem' | $FMR HearthStoneBNNews
j.rip http://www.hearthstone.com.cn/home 'div.homeNewsWrap' 'h4' | ./jrrs.sh HearthStoneBNNews

#ng-rip.rb -u http://h.163.com/ <(curl -s http://h.163.com/ | iconv -f GBK -t UTF-8) '#hotlist h2.blog-title a' | $FMR HearthStone163News
j.rip -u http://h.163.com/ <(curl -s http://h.163.com/ | iconv -f GBK -t UTF-8) 'div.blog-news' 'a' | ./jrrs.sh HearthStone163News

#j.rip 'http://dv.56.com/funny/?do=review' 'div.review_list li' 'div.vid_info' | ./jrrs.sh WeiBoJiangHu

#j.rip http://bt.ktxp.com/team-222-1.html 'td.ttitle' 'a:eq(2)' 'a:eq(2)' | ./jrrs.sh KRL

#j.rip 'http://bt.ktxp.com/search.php?keyword=JOJO%E5%A5%87%E5%A6%99%E5%86%92%E9%99%A9%E5%90%A7' 'td.ttitle' 'a:eq(2)' 'a:eq(2)' | ./jrrs.sh JoJo3KTXP
#
#j.rip 'http://bt.ktxp.com/search.php?keyword=%E6%B8%B8%E6%88%8F%E7%8E%8B' 'td.ttitle' 'a:eq(2)' 'a:eq(2)' | ./jrrs.sh YuGiOh_ARCV_KTXP
#
#j.rip 'http://bt.ktxp.com/search.php?keyword=%E7%81%AB%E6%98%9F%E5%BC%82%E7%A7%8D' 'td.ttitle' 'a:eq(2)' 'a:eq(2)' | ./jrrs.sh TerraFormars_KTXP
#
#j.rip 'http://bt.ktxp.com/search.php?keyword=%E7%89%99%E7%8B%BC' 'td.ttitle' 'a:eq(2)' 'a:eq(2)' | ./jrrs.sh Garo_KTXP
#
#j.rip 'http://bt.ktxp.com/search.php?keyword=%E5%AF%84%E7%94%9F%E5%85%BD' 'td.ttitle' 'a:eq(2)' 'a:eq(2)' | ./jrrs.sh Kiseijuu_KTXP

#j.rip http://www.chinaocg.cn/ 'div.items' 'a' | ./jrrs.sh CHINAOCG

j.rip 'http://book.douban.com/latest?icn=index-latestbook-all' 'div.article ul li:not([class*=clear])' 'div.detail-frame h2' 'a' |  ./jrrs.sh DoubanNewBookFiction

j.rip 'http://book.douban.com/latest?icn=index-latestbook-all' 'div.aside ul li:not([class*=clear])' 'div.detail-frame h2' 'a' |  ./jrrs.sh DoubanNewBookReal

j.rip 'http://kr.hujiang.com/new/tag/%E9%9F%A9%E8%AF%AD%E6%AF%8F%E6%97%A5%E4%B8%80%E5%8F%A5/' 'ul#article_list li' 'a.a_article_title' 'a.a_article_title' | head | ./jrrs.sh KoreanMeiRiYiJu

#ng-rip.rb http://bt.ktxp.com/playbill.php 'div.item-box div.container dl dd a' | $FMR KTXP_JieMuDan

hdwai() { ng-rip.rb 'http://hdwai.com/?topic_title='$1'&tvcat=0&searchsubmit=Search' 'div.body div.toplist td.name' | $FMR HDWAI_$1; }

#hdwai Z.Nation
#hdwai Supernatural
#hdwai The.Big.Bang.Theory
#hdwai Arrow
#hdwai The.Walking.Dead
#hdwai The.Mentalist
#hdwai Two.And.A.Half.Men
#hdwai Game.Of.Thrones
#hdwai Avengers.Assemble
#hdwai Marvels.Agents.of.S.H.I.E.L.D
#hdwai THe.Flash
#hdwai Doctor.Who

dmhy() { j.rip 'http://share.dmhy.org/topics/list?keyword='"$1" 'table#topic_list > tbody > tr' 'td.title > a' 'td.title > a' | head -20 | ./jrrs.sh $2 ; }

dmhy '%E5%AF%84%E7%94%9F%E7%8D%B8' Kiseijuu_dmhy
dmhy 'JOJO+%E5%A5%87%E5%A6%99' JoJoAnime_dmhy
dmhy '%E6%B8%B8%E6%88%8F%E7%8E%8B' YuGiOh_ARCV_dmhy
dmhy '%E9%8A%80%E9%AD%82' Gintama_dmhy
dmhy '%E4%B8%80%E6%8B%B3%E8%B6%85%E4%BA%BA' OnePunchMan
dmhy 'Kowabon' Kowabon
dmhy '%E4%BA%BA%E9%80%A0%E4%BA%BA009' Cyborg009
dmhy '%E4%BA%9E%E4%BA%BA' Ajin
dmhy 'kagewani' Kagewani
dmhy '%E5%9D%82%E6%9C%AC' SakamotoDesuga
dmhy 'Joker+Game' JokerGame
dmhy '%E7%94%B2%E9%90%B5%E5%9F%8E' KoutetsujouNoKabaneri
dmhy '%E6%88%91%E7%9A%84%E8%8B%B1%E9%9B%84%E5%AD%A6%E9%99%A2' BokuNoHeroAcademia
dmhy '%E7%83%99%E5%8D%B0%7C%E5%8A%8D%E9%A2%A8' Berserk

curl -s 'http://www.cnkszx.com/info/gateMenu.action?menu.menuCode=030103' | grep javascript:view | sed 's/<\/a.*//' | sed 's/.*>//' | perl -ple '$_="http://www.cnkszx.com/info/gateMenu.action?menu.menuCode=030103|".$_' | $FMR XiaoXueZhaoSheng

j.rip http://www.bttiantang.com/ 'div.ml div.item:has(div)' 'div.title p.tt a' 'div.title p.tt a' 'div.litpic a img' | ./jrrs.sh BT_TianTang

j.rip http://www.6vhao.net/ 'div.tjlist ul li' 'p' 'a' 'a img' | head -10 | ./jrrs.sh 6vhao

j.rip http://www.ituring.com.cn/ 'div.tbox div.tab dl:first div.arc-list dl dt' 'a' | ./jrrs.sh ituring

curl -s http://d.163.com/ | iconv -f GBK -t UTF-8 > ,t
j.rip -u http://d.163.com/ ,t 'div.blog-articles div.article-wrapper' 'div.article-content h2 a' 'div.article-content h2 a' 'div.article-image a img' | ./jrrs.sh D3_163

#xunbo() { pq-rip.py http://www.4567.tv/film/id$1.html 'p.name' | perl -pe '$_ = "http://www.4567.tv/film/id'$1'.html|".$_' | $FMR xunbo_$2; }
xunbo() { pq-rip.py http://www.4567.tv/film/id$1.html 'div.play-list a' | perl -pe '$_ = "http://www.4567.tv/film/id'$1'.html|".$_' | $FMR xunbo_$2; }

xunbo 20296 GameOfThrone
xunbo 20663 SiliconValley
xunbo 21987 ShouTaiJyou

#magdown() { j.rip 'http://cili001.com/?topic_title3='"$1" 'span.b' 'a' 'a' | ./jrrs.sh magdown_$2 ; }
magdown() { j.rip 'http://cili04.com/?topic_title3='"$1" 'span.b' 'a' 'a' | ./jrrs.sh magdown_$2 ; }

magdown '%E6%9D%83%E5%8A%9B%E7%9A%84%E6%B8%B8%E6%88%8F' GameOfThrones
magdown '%E7%A1%85%E8%B0%B7' SiliconValley
magdown '%E9%BB%91%E5%AE%A2%E5%86%9B%E5%9B%A2' MrRobot
magdown '%E7%9C%9F%E5%AE%9E%E7%9A%84%E4%BA%BA%E7%B1%BB' Humans
magdown '%E8%A1%8C%E5%B0%B8%E4%B9%8B%E6%83%A7' FearTheWalkingDead
magdown 'Extant' Extant
magdown 'Strain' TheStrain
magdown 'BattleBots' BattleBots
magdown '%E5%83%B5%E5%B0%B8%E5%9B%BD%E5%BA%A6' ZNation
magdown '%E7%A5%9E%E7%A7%98%E5%8D%9A%E5%A3%AB' DoctorWho
magdown '%E7%94%9F%E6%B4%BB%E5%A4%A7%E7%88%86%E7%82%B8' BigBangTheory
magdown '%E8%8B%B1%E9%9B%84' Heroes
magdown '%E7%A5%9E%E7%9B%BE' Shield
magdown 'Arrow' Arrow
magdown 'Flash' Flash
magdown '%E5%87%B6%E9%AC%BC%E6%81%B6%E7%81%B5' Supernatural
magdown '%E9%AC%BC%E7%8E%A9%E4%BA%BA' AshVSEvilDead
magdown '%E6%B2%99%E5%A8%9C%E6%8B%89%E4%BC%A0%E5%A5%87' TheShannaraChronicles

webtoon() { j.rip 'http://www.webtoons.com/zh-hans/thriller/'"$1" 'ul#_listUl li' 'span.subj' 'a' 'span.thmb img' | ./jrrs.sh webtoon_$2 ; }

webtoon "tales-of-the-unusual/list?title_no=296" QiQiGuaiGuai
webtoon "hive/list?title_no=223" ChongXue
webtoon "jinri/list?title_no=642" JinYaoRi

dbfansub() { pq-rip.py http://dbfansub.com/tvshow/$1.html 'article#content div.panel-body div.entry-content table tbody tr td.el-s-left a' | perl -pe '$_ = "http://dbfansub.com/tvshow/'$1'.html|".$_' | $FMR dbfansub_$2; }

dbfansub 7691 RickAndMortyS02

#xiamp4() { pq-rip.py http://www.xiamp4.com/Html/$1.html 'p.name' | perl -pe '$_ = "http://www.xiamp4.com/Html/'$1'.html|".$_' | $FMR xiamp4_$2; }
xiamp4() { pq-rip.py http://www.xiamp4.com/Html/$1.html 'div.play-list a' | perl -pe '$_ = "http://www.xiamp4.com/Html/'$1'.html|".$_' | $FMR xiamp4_$2; }

xiamp4 GP22444 ZhenTianWan
xiamp4 GP23720 Ushijima3

pq-rip.py -u http://www.kankanews.com/shanghai/ 'div.listcontent div.list-item a.title' | $FMR KanKanNewsShanghai

curl -s http://toutiao.io | grep -A 2 '<h3 class="title">' | grep target | sed 's/<\/.*//' | sed 's/.*href="//' | sed 's/">/\|/' | $FMR TouTiao

#j.rip http://www.freebuf.com/ 'div#timeline div.news-info dt' 'a' | ./jrrs.sh FreeBuf

date
echo ======================================
