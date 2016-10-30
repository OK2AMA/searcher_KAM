#!/usr/bin/env python3
#
# Script fot searching free places at Brno VUT acomodation system,
# it working only from inside network.

import irllib2

url = 'https://www.kn.vutbr.cz/search/index.html?str='

response = urllib2.urlopen(url)
webContent = response.read()

print(webContent[0:300])

"""
from urllib2 import urlopen

page = urlopen('http://www.example.com').read()

import re
pattern = re.compile('^some regex$')
match = pattern.search(page)

"""

