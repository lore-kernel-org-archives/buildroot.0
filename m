From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 13:20:44 +0200
Subject: [Buildroot] Binary ATI driver package in buildroot
Message-ID: <1302088845-15193-1-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey

I would like to use ATI's binary device drivers in my buildroot project. I have
therefore created the package fglrx. Right now it will only work for 64bit, and
it does not detect of the target system is x86 or not. These things should
of cause be fixed if the package are to be included in buildroot.

My question is whether such a package should exist in buildroots repository or
not.

Also, I would like comments if this is the right way to build and include
external binary device drivers. (Sorry, I'am still new to hacking buildroot)

--
Allan W. Nielsen
