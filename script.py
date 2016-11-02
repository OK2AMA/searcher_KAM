#!/usr/bin/env python3
#
# Script fot searching free places at Brno VUT acomodation system,
# it working only from inside network.

import urllib2

url = 'https://www.kn.vutbr.cz/search/index.html?str='

build = "B07"
room = "1216"

url = url + build + "-" + room

response = urllib2.urlopen(url)
webContent = response.read()

matches = re.findall("Jméno:",webContent)

print("Počet obsazených pokojů:")
print(matches)

# print(url)
# print(webContent[0:9000])
 


"""
from urllib2 import urlopen

page = urlopen('http://www.example.com').read()

import re
pattern = re.compile('^some regex$')
match = pattern.search(page)

"""

