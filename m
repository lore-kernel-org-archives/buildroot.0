From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Tue,  5 Jan 2021 16:24:12 +0100
Subject: [Buildroot] [PATCH v2 0/8] Bump NXP BSP components to 5.4.70_2.3.0
Message-ID: <20210105152420.26379-1-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Here is the patch set to bump freescale-imx configs and vital packages
to match the latest NXP Linux release: 5.4.70_2.3.0.
Some configs are run-tested, some aren't... but all are build-tested.

Notes:
  1) other components update (e.g.: imx-{codec,kobs,parser,vpu*,...})
     are not part of this patch set.
  2) gpu-viv-* components are already updated to 6.4.3.p1.0 (thanks, Gary!)

BR, 
Stephane.

Stephane Viau (8):
  package/freescale-imx/firmware-imx: bump version to 8.10
  package/freescale-imx/imx-sc-firmware: bump version to 1.7.0
  package/freescale-imx/imx-seco: bump version to 3.7.4
  package/imx-mkimage: bump to version rel_imx_5.4.70_2.3.0
  configs/freescale_imx6*: bump BSP components to 5.4.70_2.3.0
  configs/freescale_imx7dsabresd: bump BSP components to 5.4.70_2.3.0
  configs/freescale_imx8m*: bump BSP components to 5.4.70_2.3.0
  configs/freescale_imx8*: bump BSP components to 5.4.70_2.3.0

 configs/freescale_imx6dlsabreauto_defconfig               | 4 ++--
 configs/freescale_imx6dlsabresd_defconfig                 | 4 ++--
 configs/freescale_imx6qsabreauto_defconfig                | 4 ++--
 configs/freescale_imx6qsabresd_defconfig                  | 4 ++--
 configs/freescale_imx6sxsabresd_defconfig                 | 4 ++--
 configs/freescale_imx6ullevk_defconfig                    | 4 ++--
 configs/freescale_imx7dsabresd_defconfig                  | 4 ++--
 configs/freescale_imx8mmevk_defconfig                     | 8 ++++----
 configs/freescale_imx8mnevk_defconfig                     | 6 +++---
 configs/freescale_imx8mqevk_defconfig                     | 6 +++---
 configs/freescale_imx8qmmek_defconfig                     | 6 +++---
 configs/freescale_imx8qxpmek_defconfig                    | 6 +++---
 package/freescale-imx/firmware-imx/firmware-imx.hash      | 6 +++---
 package/freescale-imx/firmware-imx/firmware-imx.mk        | 2 +-
 .../freescale-imx/imx-sc-firmware/imx-sc-firmware.hash    | 6 +++---
 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk  | 2 +-
 package/freescale-imx/imx-seco/imx-seco.hash              | 6 +++---
 package/freescale-imx/imx-seco/imx-seco.mk                | 2 +-
 package/imx-mkimage/imx-mkimage.hash                      | 2 +-
 package/imx-mkimage/imx-mkimage.mk                        | 2 +-
 20 files changed, 44 insertions(+), 44 deletions(-)

-- 
2.29.2
