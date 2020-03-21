From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Mar 2020 16:16:14 +0100
Subject: [Buildroot] [PATCH 0/5] updates of the NXP i.MX8QM/QXP
In-Reply-To: <20200320163158.18341-1-maeva.manuel@oss.nxp.com>
References: <20200320163158.18341-1-maeva.manuel@oss.nxp.com>
Message-ID: <20200321161614.147e9e0c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 Mar 2020 17:31:53 +0100
Maeva Manuel <maeva.manuel@oss.nxp.com> wrote:

> The patch queue updates the defconfigs for NXP i.MX8QM and i.MX8QXP to NXP BSP 4.19.35_1.1.0
> and the necessary BSP dependancies (imx-seco, firmware-imx, imx-sc-firmware, imx-mkimage).
> 
> Maeva Manuel (5):
>   package/freescale-imx/imx-seco: new package
>   package/freescale-imx/firmware-imx: bump version to 8.5
>   package/freescale-imx/imx-sc-firmware: bump to version 1.2.7.1
>   package/imx-mkimage: bump to version rel_imx_4.19.35_1.1.0
>   configs/freescale_imx8q{m,xp}mek: bump BSP components to 4.19.35_1.1.0

Thanks, I've applied the entire series, but I have a few comments about
some of the patches, I'll reply to them individually.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
