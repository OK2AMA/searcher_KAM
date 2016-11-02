#!/usr/bin/env python
#
# Script fot searching free places at Brno VUT acomodation system,
# it working only from inside network.

import urllib2
import re

url = 'https://www.kn.vutbr.cz/search/index.html?str='

one_free_triple_room = 0
two_free_triple_room = 0
three_free_triple_room = 0
full_free_triple_room = 0

full_free_double = 0
one_free_double_room = 0
two_free_double_room = 0

print("Script for searching free rooms at acomodation VUT Brno")
ans=False
while False == ans :
    print (" Do you want looking in which block? ")
    print (" 1. B07 ")
    print (" 2. B04 ")
    print (" 3. B05 ")
    print (" 4. B06 ")
    print ("*************************************")
    ans=input("What would you like to do?")
    if ans=="1":
        print("\n B07")
        build = "B07"
    elif ans=="2":
        print("\n B04")
        build = "B04"  
    elif ans=="3":
        print("\n B05") 
        build = "B05"
    elif ans=="4":
        print("\n B06")
        build = "B06" 
    elif ans !="":
        print("\n Not Valid Choice Try again") 

for floor in range(1, 13):
    for room in range(1, 22):
        unit = ( floor * 100 ) + room
        build = "B07"
        url_all = url + build + "-" + str(unit)
        
        response = urllib2.urlopen(url_all)
        webContent = response.read()

        matches = re.findall("Pokoj:",webContent)
        print(url_all)
        print(full_free_triple_room, one_free_triple_room, two_free_triple_room, three_free_triple_room )
        if ( room % 2 ):
            # liche     - dvoujluzkac
            if len(matches) == 3 :               
                full_free_triple_room += 1
            if len(matches) == 2 :              
                one_free_triple_room += 1
            if len(matches) == 1 :              
                two_free_triple_room += 1
            if len(matches) == 0 :              
                three_free_triple_room += 1
        else:    
            # sude 1216 - trojluzkac
            if len(matches) == 2 :              
                full_free_triple_room += 1
            if len(matches) == 1 :              
                one_free_triple_room += 1
            if len(matches) == 0 :              
                two_free_triple_room += 1


print("Pocet obsazenych pokoju:")
print(len(matches))

 
# print(url)
# print(webContent[0:9000])
 


"""
from urllib2 import urlopen

page = urlopen('http://www.example.com').read()

import re
pattern = re.compile('^some regex$')
match = pattern.search(page)

"""

