From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 22 Oct 2016 23:14:54 +0200
Subject: [Buildroot] host-gcc-final-6.1.0 broken with musl
References: <si5l4dx0de.ln2@ID-313208.user.individual.net>
Message-ID: <ef1tddxjqc.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 02 Jul 2016 18:09:32 +0200 schrieb Bernd Kuhls:

> Hi,
> 
> compiling this defconfig
> 
> BR2_x86_pentium_mmx=y
> BR2_TOOLCHAIN_BUILDROOT_MUSL=y
> BR2_GCC_VERSION_6_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> 
> fails:

Hi,

the bug is still present with host-gcc-final-6.2.0.

Regards, Bernd
