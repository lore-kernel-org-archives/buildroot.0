From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Dec 2018 14:59:01 +0100
Subject: [Buildroot] [PATCH 2/2] configs/freescale_imx7dsabresd: Apply
 upstream U-Boot fix
In-Reply-To: <20181220165412.7982-2-festevam@gmail.com> (Fabio Estevam's
 message of "Thu, 20 Dec 2018 14:54:12 -0200")
References: <20181220165412.7982-1-festevam@gmail.com>
 <20181220165412.7982-2-festevam@gmail.com>
Message-ID: <87tvj7t1zu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

 > NXP U-Boot tree has the following build issue:
 >   MKIMAGE u-boot-dtb.imx
 > Error: No BOOT_FROM tag in board/freescale/mx7dsabresd/imximage.cfg.cfgtmp
 > arch/arm/imx-common/Makefile:91: recipe for target 'u-boot-dtb.imx' failed
 > make[2]: *** [u-boot-dtb.imx] Error 1
 > Makefile:877: recipe for target 'u-boot-dtb.imx' failed

 > This issue has been fixed by commit  f916757300c1  ("imx: Create
 > distinct pre-processed mkimage config files"), so backport this
 > commit to the NXP U-Boot tree in order to fix the build error.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/136980027

 > Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

 > Signed-off-by: Fabio Estevam <festevam@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
