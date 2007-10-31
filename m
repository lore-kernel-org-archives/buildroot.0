From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 31 Oct 2007 21:46:02 +0100
Subject: [Buildroot] make error with Kismet even if not selected
In-Reply-To: <13504645.post@talk.nabble.com>
References: <20071030091652.2D272A67F9@busybox.net>
	<47273782.1000900@linuxtv.org>  <13504645.post@talk.nabble.com>
Message-ID: <1193863562.4728.0.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2007-10-31 klockan 01:21 -0700 skrev Hebbar:
> Hi,
> 
>  i get an error as below when "make world" is given. This is with todays
> buildroot snapshot i havent selected kismet in network utilities section.
> still kismet tries to download and build.
> 
> Regards
> Gururaja
> 

This is a known bug, and fixed in the svn, but not in the snapshot.
Download todays snapshot and try again.


> checking build system type... i386-pc-linux-gnu
> checking host system type... arm-unknown-linux-gnu
> checking for arm-linux-gcc...
> /home/guru/project/toolchain/uclibc/usr/bin/arm-linux-uclibcgnueabi-gcc -Os
> -pipe  -I/home/guru/project/toolchain/uclibc/usr/include
> -I/home/guru/project/toolchain/uclibc/include
> --sysroot=/home/guru/project/toolchain/uclibc/ -isysroot
> /home/guru/project/toolchain/uclibc -mtune=arm9tdmi
> checking for C compiler default output file name... 
> configure: error: C compiler cannot create executables
> See `config.log' for more details.
> make: ***
> [/home/guru/project/original/bldrt/buildroot/build_arm/kismet-2007-10-R1/.configured]
> Error 77
> 
> 
-- 
Best Regards,
Ulf Samuelsson
