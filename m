From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Wed, 1 Aug 2012 14:01:10 -0700 (PDT)
Subject: [Buildroot] glibc instead of ulibc ?
Message-ID: <1343854870.70701.YahooMailNeo@web164605.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello
?
I've built root file system for ARM board and now try to cross
compile simple (graphical) program, using Lazarus.
Althouth I'm pretty sure that I correctly configured Lazarus, some
errors emerged?(eg. libX11.so: undefined reference to strcpy, ... fclose; fseek ...).
Seems to me?that at least part of?the?problem lies in?having uclibc,
instead of glibc. 
So my question is - how (if possible) can I?build root file system 
with glibc instead of?uclibc.
?
Best regards?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120801/cdc42ed7/attachment.html>
