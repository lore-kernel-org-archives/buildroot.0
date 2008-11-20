From: =?windows-1251?B?1+jt6u7iIMDt5PDl6Q==?= <blackmesa@rambler.ru>
Date: Thu, 20 Nov 2008 08:57:30 +0300
Subject: [Buildroot] How to build JFFS2 image?
Message-ID: <992979110.1227160650.58589880.19478@mcgi70.rambler.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.

I can not build JFFS2 image using buildroot.
My build attempts always crashes with different errors in 
.../project_build_mipsel/uclibc/linux-2.6.26.3:
errors are like smth unresolved symbol in object file or unknown type in 
C source file......

May be it is because I use "advanced linux kernel" configuration?

I have Ubuntu8.04 x86 host machine.
My target architecture is mipsel.

How can I build target JFFS2 image using buildroot and/or mkfs.jffs2 
command ?

Thanks.
