From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Mar 2020 23:10:18 +0100
Subject: [Buildroot] [PATCH 1/1] configs/freescale_imx6{dl, q,
 sx}*: bump BSP components to 4.19.35_1.1.0
In-Reply-To: <20200326132320.79708-1-julien.olivain@oss.nxp.com>
References: <20200326132320.79708-1-julien.olivain@oss.nxp.com>
Message-ID: <20200326231018.4d48b76e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Mar 2020 14:23:20 +0100
Julien Olivain <julien.olivain@oss.nxp.com> wrote:

> Also:
> - drop uboot patch accepted upstream in v2018.05 in
>   commit f916757300c15aa1a3f0ccc98e7abb8a84c97da0
> - Add kernel dependency on host-openssl needed for v4.19.
> - Rebased uboot patch
> 
> Tested-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
> (Tested on i.MX6Quad SabreAuto)
> Signed-off-by: Julien Olivain <julien.olivain@oss.nxp.com>
> ---
>  ...nct-pre-processed-mkimage-config-fil.patch | 89 -------------------
>  ...-boot-Linux-to-init-in-mfgtools-mode.patch | 29 +++---
>  configs/freescale_imx6dlsabreauto_defconfig   |  9 +-
>  configs/freescale_imx6dlsabresd_defconfig     |  9 +-
>  configs/freescale_imx6qsabreauto_defconfig    |  9 +-
>  configs/freescale_imx6qsabresd_defconfig      |  9 +-
>  configs/freescale_imx6sxsabresd_defconfig     |  9 +-
>  7 files changed, 40 insertions(+), 123 deletions(-)
>  delete mode 100644 board/freescale/imx6sabre/patches/uboot/0002-imx-Create-distinct-pre-processed-mkimage-config-fil.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
