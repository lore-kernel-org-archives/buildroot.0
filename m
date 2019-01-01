From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Jan 2019 16:28:40 +0100
Subject: [Buildroot] [PATCH 1/2] configs/imx6slevk: Bump U-Boot version
In-Reply-To: <20181220165412.7982-1-festevam@gmail.com> (Fabio Estevam's
 message of "Thu, 20 Dec 2018 14:54:11 -0200")
References: <20181220165412.7982-1-festevam@gmail.com>
Message-ID: <87h8ess8gn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

 > U-Boot 2017.11 has the following build issue:
 >   MKIMAGE u-boot-dtb.imx
 > Error: No BOOT_FROM tag in board/freescale/mx6slevk/imximage.cfg.cfgtmp
 > arch/arm/mach-imx/Makefile:86: recipe for target 'u-boot-dtb.imx' failed
 > make[2]: *** [u-boot-dtb.imx] Error 1
 > Makefile:907: recipe for target 'u-boot-dtb.imx' failed
 > make[1]: *** [u-boot-dtb.imx] Error 2
 > make[1]: *** Waiting for unfinished jobs....

 > This issue has been fixed by commit  f916757300c1  ("imx: Create
 > distinct pre-processed mkimage config files"), which landed in
 > U-Boot 2018.05.

 > Bump the U-Boot version to fix this build error.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/136980040

 > Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com> 
 > Signed-off-by: Fabio Estevam <festevam@gmail.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
