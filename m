From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sun, 15 Apr 2007 11:02:15 +0200
Subject: [Buildroot] Buildroot fails to compile for QEMU,
	with flag BR2_TARGET_ARM_INTEGRATOR_926=y
In-Reply-To: <545178E7F5D6364CA182451CF7958ADAE14422@BLR-EC-MBX01.wipro.com>
References: <545178E7F5D6364CA182451CF7958ADAE14422@BLR-EC-MBX01.wipro.com>
Message-ID: <20070415090215.GE23570@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 03, 2007 at 10:18:01AM +0530, kumar.gireesh at wipro.com wrote:
>
>
>Hi,
>
>I'm using buildroot-20070330.tar.bz2 for compiling an arm-linux-uclibc toolchain. 
>My intention is to run it on qemu, but when I compile the toolchain with option BR2_TARGET_ARM_INTEGRATOR_926=y, it fails.
>
>Kindly help me if anyone has fixed this.
>
>Please find the error log and config file inline.
>
>Thanks,
>Gireesh 
>
>ERROR LOG:
>----------
>
>make[1]: Entering directory `/home/wipro/arm-cross-tools/arm-qemu-test/buildroot/build_arm/linux-2.6.20.4'
>  CHK     include/linux/version.h
>make[2]: `include/asm-arm/mach-types.h' is up to date.
>  CHK     include/linux/utsrelease.h
>  CC      arch/arm/kernel/asm-offsets.s
>cc1: error: invalid option `abi=aapcs-linux'

Could very well be that gcc-3.4 doesn't support it, 4.1 or 4.2
have it, IIRC
