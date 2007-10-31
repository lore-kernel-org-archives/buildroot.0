From: Hebbar <gururajakr@sanyo.co.in>
Date: Wed, 31 Oct 2007 01:21:54 -0700 (PDT)
Subject: [Buildroot]  make error with Kismet even if not selected
In-Reply-To: <47273782.1000900@linuxtv.org>
References: <20071030091652.2D272A67F9@busybox.net>
	<47273782.1000900@linuxtv.org>
Message-ID: <13504645.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

 i get an error as below when "make world" is given. This is with todays
buildroot snapshot i havent selected kismet in network utilities section.
still kismet tries to download and build.

Regards
Gururaja

checking build system type... i386-pc-linux-gnu
checking host system type... arm-unknown-linux-gnu
checking for arm-linux-gcc...
/home/guru/project/toolchain/uclibc/usr/bin/arm-linux-uclibcgnueabi-gcc -Os
-pipe  -I/home/guru/project/toolchain/uclibc/usr/include
-I/home/guru/project/toolchain/uclibc/include
--sysroot=/home/guru/project/toolchain/uclibc/ -isysroot
/home/guru/project/toolchain/uclibc -mtune=arm9tdmi
checking for C compiler default output file name... 
configure: error: C compiler cannot create executables
See `config.log' for more details.
make: ***
[/home/guru/project/original/bldrt/buildroot/build_arm/kismet-2007-10-R1/.configured]
Error 77


-- 
View this message in context: http://www.nabble.com/svn-commit%3A-trunk-buildroot-package%3A--kismet-tf4717274.html#a13504645
Sent from the BuildRoot mailing list archive at Nabble.com.
