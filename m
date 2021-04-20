From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Tue, 20 Apr 2021 23:18:17 +0200
Subject: [Buildroot] [PATCH 0/4] Update all NXP reference board defconfigs
 to 5.10.y 1.0.0 BSP components
Message-ID: <20210420211821.31616-1-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all, 

Let me take advantage of the ongoing imx package update [1] (thank you, Sebastien!)
to also update the NXP reference board defconfig files.

BR, 
Stephane.

[1] https://patchwork.ozlabs.org/project/buildroot/list/?series=239935

Stephane Viau (4):
  configs/freescale_imx6*: bump BSP components to lf-5.10.y-1.0.0
  configs/freescale_imx7dsabresd: bump BSP components to lf-5.10.y-1.0.0
  configs/freescale_imx8m*: bump BSP components to lf-5.10.y-1.0.0
  configs/freescale_imx8*: bump BSP components to lf-5.10.y-1.0.0

 configs/freescale_imx6dlsabreauto_defconfig | 8 ++++----
 configs/freescale_imx6dlsabresd_defconfig   | 8 ++++----
 configs/freescale_imx6qsabreauto_defconfig  | 8 ++++----
 configs/freescale_imx6qsabresd_defconfig    | 8 ++++----
 configs/freescale_imx6sxsabresd_defconfig   | 8 ++++----
 configs/freescale_imx6ullevk_defconfig      | 6 +++---
 configs/freescale_imx7dsabresd_defconfig    | 8 ++++----
 configs/freescale_imx8mmevk_defconfig       | 8 ++++----
 configs/freescale_imx8mnevk_defconfig       | 8 ++++----
 configs/freescale_imx8mpevk_defconfig       | 8 ++++----
 configs/freescale_imx8mqevk_defconfig       | 8 ++++----
 configs/freescale_imx8qmmek_defconfig       | 8 ++++----
 configs/freescale_imx8qxpmek_defconfig      | 8 ++++----
 13 files changed, 51 insertions(+), 51 deletions(-)

-- 
2.31.0
