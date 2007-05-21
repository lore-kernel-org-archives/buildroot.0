From: Mats Erik Andersson <mats.andersson64@comhem.se>
Date: Mon, 21 May 2007 14:54:51 +0200
Subject: [Buildroot] [PATCH] Dropbear: fake uninstall target
Message-ID: <1179752091.5707.9.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

I got tired of the package for Dropbear always
failing when I wanted to do a complete "make clean"
in Buildroot. Therefore I suggest an elementary
patch to go with the package Bropbear, and which adds
an empty target "uninstall" to "Makefile.in".
 
I have had the same difficulty also with version 0.48
of Dropbear, so it presumably goes a long way back.
Be warned that I have been too lazy to check that
Buildroot applies this minimal patch correctly when
unpacking, since I use it on the final Makefile.

Regards,     Mats Erik Andersson
-------------- next part --------------
A non-text attachment was scrubbed...
Name: dropbear-fake-uninstall.patch
Type: text/x-patch
Size: 270 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070521/d1443c28/attachment.bin 
