From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 9 Oct 2013 11:04:16 +0200
Subject: [Buildroot] Trouble building the manual
Message-ID: <10469D7B3F0C4FA0BDDC951C132C8F83@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi 

Building the manual seems to be broken.
 
# make manual-pdf
>>>   Updating the manual lists...
Traceback (most recent call last):
  File "/home/buildroot12git/support/scripts/gen-manual-lists.py", line 41, in <module>
    from argparse import ArgumentParser
ImportError: No module named argparse
make: *** [manual-update-lists] Error 1

Sagaert Johan
