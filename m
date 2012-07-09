From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Mon, 9 Jul 2012 02:22:28 -0700 (PDT)
Subject: [Buildroot] (no subject)
Message-ID: <1341825748.43055.YahooMailNeo@web160701.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hy all
?
As a newbie in?embedded linux world, I have many questions but for the 
begininig those two.
I'm trying to build XOrg, using Buildroot for my Mini2440 ARM board.
Building passed Ok and when I login as root and type startx -
I receive an error stating that there is no /dev/tty0 - which is true.
I wonder, why udev didn't fill /dev node with tty entries.
What I checked in menuconfig?is support for C++, large files, wchar.
Then: ?modular XOrg, xf86-input-keyboard?, xf86-input-mouse,
xf86-video-fbdev,? xf86-input-evdev, without window manager 
(I think X should start even without?it).??
Also, if anyone can help how to change run level - inittab says that 
Busybox init doesn't support run levels and instead to use sysvinit ?
?
Djdjdjole
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120709/58cb7bd1/attachment-0001.html>
