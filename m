From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Mar 2018 10:39:40 +0100
Subject: [Buildroot] Freescale defconfigs failing to build U-Boot
In-Reply-To: <20180305103341.4afeacac@windsurf.home>
References: <20180305103341.4afeacac@windsurf.home>
Message-ID: <20180305103940.53b67a24@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 5 Mar 2018 10:33:41 +0100, Thomas Petazzoni wrote:

>   MKIMAGE u-boot-dtb.imx
> Error: No BOOT_FROM tag in board/freescale/mx6sxsabresd/imximage.cfg.cfgtmp
> arch/arm/imx-common/Makefile:91: recipe for target 'u-boot-dtb.imx' failed
> 
> (for freescale_imx6sxsabresd_defconfig, see
> https://gitlab.com/tpetazzoni/buildroot/-/jobs/55673304)
> 
> and:
> 
> 
>   MKIMAGE u-boot-dtb.imx
> Error: No BOOT_FROM tag in board/freescale/mx6sabresd/mx6q_4x_mt41j128.cfg.cfgtmp
> arch/arm/imx-common/Makefile:91: recipe for target 'u-boot-dtb.imx' failed
> 
> (for freescale_imx6qsabresd_defconfig, see
> https://gitlab.com/tpetazzoni/buildroot/-/jobs/55673302)

The freescale_imx6qsabreauto_defconfig also fails to build in the same
way:

  https://gitlab.com/tpetazzoni/buildroot/-/jobs/55673301

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
