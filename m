From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Jul 2020 15:26:31 +0200
Subject: [Buildroot] [PATCH 1/2] configs/freescale_imx6*: bump BSP
 components to 5.4.24_2.1.0
In-Reply-To: <20200703165744.3192656-1-julien.olivain@oss.nxp.com>
References: <20200703165744.3192656-1-julien.olivain@oss.nxp.com>
Message-ID: <20200705152631.58d0afd4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  3 Jul 2020 18:57:43 +0200
Julien Olivain <julien.olivain@oss.nxp.com> wrote:

> And rebase uboot patch.
> 
> Tested-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
> [Maeva: Tested on i.MX6Quad SabreAuto CPU1]
> Signed-off-by: Julien Olivain <julien.olivain@oss.nxp.com>
> ---
>  ...abre_common-boot-Linux-to-init-in-mfgtools-mode.patch} | 8 ++++----
>  configs/freescale_imx6dlsabreauto_defconfig               | 8 ++++----
>  configs/freescale_imx6dlsabresd_defconfig                 | 8 ++++----
>  configs/freescale_imx6qsabreauto_defconfig                | 8 ++++----
>  configs/freescale_imx6qsabresd_defconfig                  | 8 ++++----
>  configs/freescale_imx6sxsabresd_defconfig                 | 8 ++++----
>  configs/freescale_imx6ullevk_defconfig                    | 6 +++---
>  7 files changed, 27 insertions(+), 27 deletions(-)
>  rename board/freescale/imx6sabre/patches/uboot/{uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch => 0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch} (89%)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
