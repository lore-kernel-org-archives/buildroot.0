From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 May 2013 22:35:17 +0200
Subject: [Buildroot] [PATCH v6 0/2] new boards
In-Reply-To: <1368180220-458-1-git-send-email-fabio.porcedda@gmail.com> (Fabio
 Porcedda's message of "Fri, 10 May 2013 12:03:38 +0200")
References: <1368180220-458-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <878v3l1chm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 Fabio> v6:
 Fabio>   - use defconfig file instead of a patch
 Fabio>   - lock linux version 3.9.1 for kernel and headers
 Fabio> v5:
 Fabio>   - drop already accepted patches
 Fabio>   - add comments to the defconfigs
 Fabio>   - add comment about pro3 watchdog
 Fabio>   - add BR2_arm926t=y
 Fabio>   - lock down kernel and headers
 Fabio> v4:
 Fabio>   - add patch to use BR2_LINUX_KERNEL_LATEST_VERSION
 Fabio>   - change back BR2_TARGET_BAREBOX_2013_04 -> BR2_TARGET_BAREBOX_LATEST_VERSION
 Fabio>   - bump barebox
 Fabio> v3:
 Fabio>   - removed BR2_PREFER_STATIC_LIB=y from boards defconfigs
 Fabio>     as asked by Thomas
 Fabio>   - renamed BR2_TARGET_BAREBOX_LATEST_VERSION -> BR2_TARGET_BAREBOX_2013_04
 Fabio>     as asked by Thomas
 Fabio> v2:
 Fabio>   - Telit EVK-PRO3: use barebox custom version option

 Fabio> Fabio Porcedda (2):
 Fabio>   configs: add defconfig for Telit EVK-PRO3
 Fabio>   configs: add defconfig for Atmel AT91SAM9260-EK Nand Flash Boot

Committed series, thanks.

-- 
Bye, Peter Korsgaard
