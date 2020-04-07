From: Laurent Gauthier (OSS) <laurent.gauthier_1@oss.nxp.com>
Date: Tue,  7 Apr 2020 22:20:41 +0200
Subject: [Buildroot] [PATCH 0/2] Bump i.MX* VPU packages to NXP BSP
 4.19.35_1.1.0
Message-ID: <20200407202044.9924-1-laurent.gauthier_1@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Laurent Gauthier <laurent.gauthier_1@oss.nxp.com>

Hi all,

More package being bumped to match NXP BSP 4.19.35_1.1.0.

Kind Regards, Laurent.

Laurent GAUTHIER (2):
  package/freescale-imx/imx-vpu: bump version to 5.4.39.1
  package/freescale-imx/imx-vpuwrap: bump version to 4.5.1

 package/freescale-imx/imx-vpu/imx-vpu.hash         | 6 +++---
 package/freescale-imx/imx-vpu/imx-vpu.mk           | 2 +-
 package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash | 6 +++---
 package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk   | 8 +++++---
 4 files changed, 12 insertions(+), 10 deletions(-)

-- 
2.17.1
