From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Tue, 07 Sep 2010 17:53:41 +0100
Subject: [Buildroot] Why is extfs filesystem mandatory?
In-Reply-To: <4C8669B3.4030209@jdines.net>
References: <4C863CDD.8020805@jdines.net> <20100907165546.06ed2a29@surf>
	<4C8669B3.4030209@jdines.net>
Message-ID: <1283878421.11196.7.camel@dubciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ar M?irt, 2010-09-07 ag 12:34 -0400, scr?obh James J. Dines:

> In the menuconfig, under "Target Filesystems" I have an asterisk
> surrounded by dashes, i.e.:
> 
> - -*- ext2 root filesystem

Do you have ISO9660 FS enabled by any chance?

From the help for ext2:
Selected by: BR2_TARGET_ROOTFS_ISO9660 && (BR2_i386 || BR2_x86_64) && BR2_LINUX_KERNEL
