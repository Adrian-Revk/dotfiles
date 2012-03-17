import sys
import urllib2            # For internet connection test

def test():
    try:
        response = urllib2.urlopen("http://www.google.com", timeout = 1)
        return True
    except urllib2.URLError as err: pass
    return False
