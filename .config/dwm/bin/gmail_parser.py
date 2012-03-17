## check-gmail.py -- A command line util to check GMail -*- Python -*-
## modified to display mailbox summary for conky

# ======================================================================
# Copyright (C) 2006 Baishampayan Ghose <b.ghose@ubuntu.com>
# Modified 2008 Hunter Loftis <hbloftis@uncc.edu>
# Time-stamp: Mon Jul 31, 2006 20:45+0530
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
# ======================================================================

import sys
import urllib             # For BasicHTTPAuthentication
import feedparser         # For parsing the feed
from textwrap import wrap

import test_connection

_URL = "https://mail.google.com/gmail/feed/atom"

uname = sys.argv[1]
password = sys.argv[2]
maxlen = sys.argv[3]

urllib.FancyURLopener.prompt_user_passwd = lambda self, host, realm: (uname, password)
    
def auth():
    '''The method to do HTTPBasicAuthentication'''
    opener = urllib.FancyURLopener()
    f = opener.open(_URL)
    feed = f.read()
    return feed

color0 = '\033[0m'

def readmail(feed, maxlen):
    '''Parse the Atom feed and print a summary'''
    atom = feedparser.parse(feed)
    if 0 < len(atom.entries):
        color1 = '^fg(\#e66693)'
    else:
        color1 = ''
    print color1 + '%s' % (len(atom.entries))

if __name__ == "__main__":
    if test_connection.test() == True:
        f = auth()  # Do auth and then get the feed
        readmail(f, int(maxlen)) # Let the feed be chewed by feedparser
    else:
        print "??"
