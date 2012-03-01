From: bifferos <bifferos@yahoo.co.uk>
Date: Thu, 01 Mar 2012 00:52:12 +0000
Subject: [Buildroot] Kernel and buildroot in 1MB
Message-ID: <4F4EC83C.7090208@yahoo.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

So far I have been using buildroot only to extract the busybox binary 
and use it with my own hand-crafted rootfs, because pretty much any 
binaries other than busybox put me over the limit.  It would be nice to 
use the buildroot filesystem as generated, so my question is this:  If I 
build a busybox statically linked to uclibc, how can I remove *all* the 
other binaries, e.g. uclibc .so?  Or does the build system not support that?

I'm sorry if I've missed some obvious option(s) to do this, but I've 
been studying the menu system for some time.

thanks,
Biff.
