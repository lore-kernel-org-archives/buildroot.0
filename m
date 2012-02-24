From: MERCADIER Johann <johann.mercadier@imerir.com>
Date: Fri, 24 Feb 2012 08:43:35 +0000
Subject: [Buildroot] BR 2012 & pandaboard :: BOOT issue
In-Reply-To: <4F473C51.2050500@visionsystems.de>
References: <CAPEB33zmLTp+95wimobRGVi+Ze4t_7ikSc44goGUpbmmqYZ6Bw@mail.gmail.com>
 <4F473C51.2050500@visionsystems.de>
Message-ID: <CAPEB33y3AJkE7xQPEGYRpx5G2hXz7SZgd_nCHy+Zd8oQQm-yRg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here are some infos on my toolchain built using BR, I didn't not find much
difference with yours Yegor but for the newbie I am, I probably miss
something?...

I will try to compile uboot on its own without using BR and see if the
things get better?
If you have any other ideaS I will be please to read them!

___[ EXTRACT ]______________________________
$ arm-linux-gcc -v
Using built-in specs.
COLLECT_GCC=./arm-linux-gcc
COLLECT_LTO_WRAPPER=/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/workdone/usr/libexec/gcc/arm-unknown-linux-uclibcgnueabi/4.5.3/lto-wrapper
Target: arm-unknown-linux-uclibcgnueabi
Configured with:
/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/output/toolchain/gcc-4.5.3/configure
--prefix=/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/workdone/usr
--build=i686-pc-linux-gnu
--host=i686-pc-linux-gnu
--target=arm-unknown-linux-uclibcgnueabi
--enable-languages=c,c++
--with-sysroot=/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/workdone/usr/arm-unknown-linux-uclibcgnueabi/sysroot
--with-build-time-tools=/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/workdone/usr/arm-unknown-linux-uclibcgnueabi/bin
--disable-__cxa_atexit
--enable-target-optspace
--disable-libgomp
--with-gnu-ld
--disable-libssp
--disable-multilib
--enable-tls
--enable-shared
--with-gmp=/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/workdone/usr
--with-mpfr=/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/workdone/usr
--with-mpc=/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot/workdone/usr
--enable-threads
--disable-decimal-float
--with-float=soft
--with-abi=aapcs-linux
--with-arch=armv7-a
--with-tune=cortex-a9
--with-pkgversion='Buildroot 2012.02-rc1-00008-gd54dc13'
--with-bugurl=http://bugs.buildroot.net/
Thread model: posix
gcc version 4.5.3 (Buildroot 2012.02-rc1-00008-gd54dc13)


Best regards,
-- 
Cordialement.

___Johann MERCADIER___

:(){ :|:& };:
"I am the Unknown lead by the Unknowing.
I have done so much with so little for so long
that I am now qualified to do anything with nothing."
HOOSEEK (http://www.hooseek.com/) 1?moteur de recherche solidaire!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120224/962886a5/attachment.html>
