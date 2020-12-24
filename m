From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Thu, 24 Dec 2020 07:59:38 +0100
Subject: [Buildroot] [PATCH 00/15] Bump NXP BSP components to 5.4.47_2.2.0
Message-ID: <1608793193-11843-1-git-send-email-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Here is a patch set to bump freescale-imx configs and packages to match
the latest publicly availaible Linux release, that is 5.4.47_2.2.0.
Some are run-tested, others aren't... but all are build-tested.

Enjoy!

BR,
Stephane.

Stephane Viau (15):
  package/freescale-imx/firmware-imx: bump version to 8.9
  package/freescale-imx/imx-gpu-g2d: bump to version 6.4.3.p0.0
  package/freescale-imx/imx-gpu-viv: bump version to 6.4.3.p0.0
  package/freescale-imx/imx-sc-firmware: bump version to 1.6.0
  package/freescale-imx/imx-seco: bump version to 3.7.1
  package/freescale-imx/imx-vpu: bump version to 5.4.39.3
  package/freescale-imx/imx-vpu-hantro: bump version to 1.19.0
  package/imx-mkimage: bump to version rel_imx_5.4.47_2.2.0
  configs/freescale_imx6*: bump BSP components to 5.4.47_2.2.0
  configs/freescale_imx7dsabresd: bump BSP components to 5.4.47_2.2.0
  configs/freescale_imx8mmevk: bump BSP components to 5.4.47_2.2.0
  configs/freescale_imx8mnevk: bump BSP components to 5.4.47_2.2.0
  configs/freescale_imx8mqevk: bump BSP components to 5.4.47_2.2.0
  configs/freescale_imx8qmmek: bump BSP components to 5.4.47_2.2.0
  configs/freescale_imx8qxpmek: bump BSP components to 5.4.47_2.2.0

 configs/freescale_imx6dlsabreauto_defconfig                | 4 ++--
 configs/freescale_imx6dlsabresd_defconfig                  | 4 ++--
 configs/freescale_imx6qsabreauto_defconfig                 | 4 ++--
 configs/freescale_imx6qsabresd_defconfig                   | 4 ++--
 configs/freescale_imx6sxsabresd_defconfig                  | 4 ++--
 configs/freescale_imx6ullevk_defconfig                     | 4 ++--
 configs/freescale_imx7dsabresd_defconfig                   | 4 ++--
 configs/freescale_imx8mmevk_defconfig                      | 6 +++---
 configs/freescale_imx8mnevk_defconfig                      | 6 +++---
 configs/freescale_imx8mqevk_defconfig                      | 6 +++---
 configs/freescale_imx8qmmek_defconfig                      | 6 +++---
 configs/freescale_imx8qxpmek_defconfig                     | 6 +++---
 package/freescale-imx/firmware-imx/firmware-imx.hash       | 6 +++---
 package/freescale-imx/firmware-imx/firmware-imx.mk         | 2 +-
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash         | 8 ++++----
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk           | 4 ++--
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash         | 8 ++++----
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk           | 4 ++--
 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash | 6 +++---
 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk   | 2 +-
 package/freescale-imx/imx-seco/imx-seco.hash               | 6 +++---
 package/freescale-imx/imx-seco/imx-seco.mk                 | 2 +-
 package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash   | 6 +++---
 package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk     | 2 +-
 package/freescale-imx/imx-vpu/imx-vpu.hash                 | 6 +++---
 package/freescale-imx/imx-vpu/imx-vpu.mk                   | 2 +-
 package/imx-mkimage/imx-mkimage.hash                       | 2 +-
 package/imx-mkimage/imx-mkimage.mk                         | 2 +-
 28 files changed, 63 insertions(+), 63 deletions(-)

-- 
2.7.4
