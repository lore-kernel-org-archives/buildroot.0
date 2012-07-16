From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Mon, 16 Jul 2012 02:29:06 -0700 (PDT)
Subject: [Buildroot] X11
Message-ID: <1342430946.70457.YahooMailNeo@web160701.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello 
?
I am trying to build XOrg server for ARM based board, using Buildroot . 
When starting it, I received error: 
FBDEV(0): FBIOPUT_VSCREENINFO: Invalid argument;
Fatal server error:Addscreen/ScreenInit failed for driver 0- ?and later:
xinit: giving up
xinit: unable to connect to X server - no such file or directory
xinit: server error
?
?File /usr/bin/X -exists on my device (ie. at?NFS).
Attached is my Buildroot?.config file and xorg.conf that I created in etc/X11 folder.
Kernel is build independently ie. out of Buildroot.
Any help ?
?
Thanks
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120716/60c52ccb/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 33446 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120716/60c52ccb/attachment-0002.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: xorg.conf
Type: application/octet-stream
Size: 501 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120716/60c52ccb/attachment-0003.obj>
