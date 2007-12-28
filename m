From: Corey McGuire <coreyfro@coreyfro.com>
Date: Thu, 27 Dec 2007 17:39:21 -0800
Subject: [Buildroot] Specify Modules Directory
Message-ID: <cc3fd8f30712271739m76383d3bye3e9b2c4e7b1e66b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I am new to build root having never cross compiled a linux distro before,
but I have used uclibc with gentoo for the x86 platform.  This is my first
foray into the ARM world so if I sound like a complete idiot, please go easy
on me ;-)

I am building with kernel sources based on the following patched kernel:
ftp://ftp.embeddedarm.com/ts-arm-linux-cd/sources/tskernel-2.6.21-ts-src.tar.gz

I have configured buildroot to use this source for the headers and for the
kernel, I have provided the .config's and such and tweaked them to my
specific needs (at least as well as my experience allows) but I get hung up
when at the following:
/home/coreyfro/harm/buildroot/build_arm/staging_dir/bin/arm-linux-depmod26
-b /home/coreyfro/harm/buildroot/project_build_arm/Orb-Swarm/root 2.6.21.7
WARNING: Couldn't open directory
/home/coreyfro/harm/buildroot/project_build_arm/Orb-Swarm/root/lib/modules/2.6.21.7:
No such file or directory

This directory doesn't exist because the kernel I am using wants to put
modules here:
buildroot/project_build_arm/#########/root/lib/modules/2.6.21-ts

How SHOULD I fix this (I say "should" because I am very creative when it
comes to doing things the wrong way.)

I don't believe that including config files is needed because this should be
relatively cut and dry, but not enough, so, as to be easy to find searching
the mailing list. Let me know if these files would be helpful.  I would need
to spend some effort sanitising them for public posting.

Thanks

-- 
---
----
-----     Coreyfro: just a maker, just like you
--------
--------------
--------------------------
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071227/eb186764/attachment.htm 
