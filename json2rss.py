#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import PyRSS2Gen
import json
import datetime

if len(sys.argv) < 2:
    raise Exception("need name")

name = sys.argv[1]

items = json.loads(sys.stdin.read())

rss = PyRSS2Gen.RSS2(
    title = name,
    link = 'https://www.baidu.com/',
    description = name,
    lastBuildDate = datetime.datetime.utcnow(),
    items = [
	PyRSS2Gen.RSSItem(
            title = item['title'],
            link = item['url'],
            description = item['title'],
            guid = PyRSS2Gen.Guid(item['url']),
            pubDate = datetime.datetime.utcnow(),
        )
        for item in items
    ],
)
print rss.to_xml(encoding='UTF-8')
