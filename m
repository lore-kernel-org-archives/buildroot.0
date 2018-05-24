From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 May 2018 23:04:00 +0200
Subject: [Buildroot] [PATCH 1/3] configs/freescale_imx6sololiteevk:
 Remove target
In-Reply-To: <1525561944-1511-1-git-send-email-festevam@gmail.com> (Fabio
 Estevam's message of "Sat, 5 May 2018 20:12:22 -0300")
References: <1525561944-1511-1-git-send-email-festevam@gmail.com>
Message-ID: <877ensdav3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

 > Currently this target fails to build:
 > Error: No BOOT_FROM tag in board/freescale/mx6slevk/imximage.cfg.cfgtmp
 > arch/arm/imx-common/Makefile:91: recipe for target 'u-boot-dtb.imx' failed

 > This problem has been already solved in upstream U-Boot, but not
 > on NXP version of U-Boot.

 > To avoid the maintainance burden of keeping two defconfigs for the
 > same board, remove freescale_imx6sololiteevk_defconfig in favor
 > of imx6slevk_defconfig, which uses U-Boot and kernel mainline.

 > Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/66561693
 > Signed-off-by: Fabio Estevam <festevam@gmail.com>

Committed all 3 to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
