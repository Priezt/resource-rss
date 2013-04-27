#!/bin/bash --login

date

echo PATH=$PATH

WWW=$HOME/www/rss
FMR=/home/priezt/code/resource-rss/fresh-make-rss.sh

# yayaxz
yayaxz() { curl -s $1 | grep -A 5 resource-item | grep '<a href' | grep -v 'class="type"' | perl -pe 's/.*?>//;s/<.*//;' | perl -pe '$_ = "'$1'|".$_' | $FMR $2; }

yayaxz http://www.yayaxz.com/resource/10733 GameOfThrones

# comic
pq-rip.py -u 'http://www.dm5.com/manhua-huofengliaoyuan/' '#cbc_1 > li > a' | grep -v javascript | $FMR HuoFeng
pq-rip.py -u 'http://www.dm5.com/manhua-qizhayouxi/' '#cbc_1 > li > a' | grep -v javascript | $FMR LiarGame
pq-rip.py -u 'http://www.dm5.com/manhua-jinjidejuren/' '#cbc_1 > li > a' | grep -v javascript | $FMR Giant
pq-rip.py -u 'http://www.dm5.com/manhua-jojo-qimiaomaoxiandi-08-bu/' '#cbc_1 > li > a' | grep -v javascript | $FMR JoJo8
pq-rip.py -u 'http://www.dm5.com/manhua-fengshenji-2/' '#cbc_1 > li > a' | grep -v javascript | $FMR FengShenJi2

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

echo ======================================
