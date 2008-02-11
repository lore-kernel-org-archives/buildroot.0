From: grego rigolo <gregorigolo2002@yahoo.fr>
Date: Mon, 11 Feb 2008 16:10:07 +0000 (GMT)
Subject: [Buildroot] kernel cross compilation problem (at91sam9260)
Message-ID: <642838.65822.qm@web23403.mail.ird.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hello,
I'm using the buildroot-20080206.tar.bz2 package to build a rootfilesystem and a cross compilation toolchain for my embedded board (sam9260).
I tried to cross compile (arm-linux-gcc-4.1.2) a 2.6.23 linux kernel seperately (not the one included in buildroot) , and i noticed that the size had increased by 3Mb respect to my old version.
On the other hand when i try to use the generated kernel, it hangs at the stage 
uncompressing Linux ....................
Does anyone encounters this kind of problem ?
greg





      _____________________________________________________________________________ 
Ne gardez plus qu'une seule adresse mail ! Copiez vos mails vers Yahoo! Mail http://mail.yahoo.fr
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080211/97f80182/attachment.htm 
