From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Jul 2018 16:58:55 +0200
Subject: [Buildroot] [PATCH v2 0/7] Add Boundary Devices Nitrogen8M
 support
In-Reply-To: <20180719103109.19887-1-gary.bisson@boundarydevices.com>
References: <20180719103109.19887-1-gary.bisson@boundarydevices.com>
Message-ID: <20180719165855.4ceacd6a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Jul 2018 12:31:02 +0200, Gary Bisson wrote:

> Gary Bisson (7):
>   configs/freescale_imx8mqevk: add script arg to specify U-Boot dtb
>   board/freescale/common/imx: make imx8-bootloader-prepare more generic

These two patches are really the same logical change, so I squashed
them.

>   board/boundarydevices/common/post-build.sh: fix U-Boot naming
>   board/boundarydevices: remove obsolete u-boot scripts
>   board/boundarydevices: add i.MX8MQ support to post-build.sh
>   board/boundarydevices: add i.MX8MQ support to u-boot scripts
>   configs/nitrogen8m: Add new defconfig

Entire series applied. Thanks for the quick respin taking into account
my comments!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
