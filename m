From: Paul <pbor1234@zonnet.nl>
Date: Tue, 1 Jan 2008 21:41:36 +0100
Subject: [Buildroot] How to setup buildroot to use deprecated uclibc
	(0.9.27)?
Message-ID: <20080101204143.35370CAFC@green.qinip.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to setup the buildroot crosscompiler environment to build
software (in this case proftpd 1.3.0) for my qnap device running kernel
2.6.12.3 and uclibc 0.9.27. Make menuconfig only shows me uclibc options
0.9.28.3 and 0.9.29 (so I expect to find trouble when I execute the binaries
build). And indeed, I can launch gdb (also from the toolchain) but as soon
as I load proftpd I get

 

gdb: can't resolve symbol '__ashldi3'

 

I guess this is caused by the non matching uclibc version, correct? How can
I tell for sure?

 

What is the best way to proceed (what are my options)?

-          can I somehow get buildroot to use the deprecated 0.9.27? Using
custom uclibc?

-          switch back to an older version of buildroot where 0.9.27 was
still supported? (currently using revision 20671). What revision should I
take then?

-          Or are there alternatives?

 

Why is 0.9.27 actually not in the list? (deprecated kernel version are
selectable)

 

Since I have few knowledge (yet) on this subject I would like to ask you
(the more experienced ;) for help.

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080101/84b14c38/attachment.htm 
