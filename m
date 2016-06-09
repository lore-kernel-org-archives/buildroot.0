From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 09 Jun 2016 22:01:20 +0200
Subject: [Buildroot] Update of Buildroot toolchains on autobuild.b.o
References: <20160608220152.5b54ea7d@free-electrons.com>
Message-ID: <XnsA622E005D5C4EID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni <thomas.petazzoni-
wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote in 
news:20160608220152.5b54ea7d at free-electrons.com:

> Let me know if there are other toolchain combinations that you would
> like to see tested on autobuild.b.o.

Hi Thomas,

a lot of multimedia packages (ffmpeg, mplayer & co.) contain support not only 
for mmx but also for sse*/avx*. Some of them fail in a mmx-only configuration 
so I would like to propose a toolchain based on this defconfig:

BR2_x86_pentium_mmx=y

We already have a p4 defconfig

http://autobuild.buildroot.net/toolchains/configs/br-i386-pentium4-
full.config

and defconfigs for x86_64 but none for older Intel cpu's.

Regards, Bernd
