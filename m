From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue,  1 Nov 2016 17:09:57 +0100
Subject: [Buildroot] [PATCH 0/8] Bump Freescale/NXP packages to version
	4.1.15_2.0.0_ga
Message-ID: <20161101161005.13302-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This series updates Freescale/NXP packages to be in line with the 4.1.15_2.0.0_ga release[1].

I don't expect this series to be in 2016.11 release necessarily, I just had some time so decided to submit it now.

It was tested on Nitrogen6_MAX with current nitrogen6x_defconfig as a base.

Regards,
Gary

[1] http://www.nxp.com/products/software-and-tools/software-development-tools/i.mx-software-and-tools/i.mx-6-series-software-and-development-tool-resources:IMX6_SW

Gary Bisson (8):
  configs: freescale_imx*: bump to version 4.1.15_2.0.0_ga
  imx-vpu: bump to version 5.4.35
  imx-gpu-viv: bump to version 5.0.11.p8.6
  xdriver_xf86-video-imx-viv: bump version to 5.0.11.p8.6
  kernel-module-imx-gpu-viv: bump version to 5.0.11.p8.6
  imx-codec: bump to version 4.1.4
  imx-parser: bump to version 4.1.4
  imx-vpuwrap: bump to version 1.0.68

 configs/freescale_imx6dlsabreauto_defconfig                         | 6 +++---
 configs/freescale_imx6dlsabresd_defconfig                           | 6 +++---
 configs/freescale_imx6qsabreauto_defconfig                          | 6 +++---
 configs/freescale_imx6qsabresd_defconfig                            | 6 +++---
 configs/freescale_imx6sololiteevk_defconfig                         | 6 +++---
 configs/freescale_imx6sxsabresd_defconfig                           | 6 +++---
 configs/freescale_imx6ulevk_defconfig                               | 6 +++---
 configs/freescale_imx7dsabresd_defconfig                            | 6 +++---
 package/freescale-imx/imx-codec/imx-codec.hash                      | 2 +-
 package/freescale-imx/imx-codec/imx-codec.mk                        | 2 +-
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash                  | 2 +-
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk                    | 2 +-
 package/freescale-imx/imx-parser/imx-parser.hash                    | 2 +-
 package/freescale-imx/imx-parser/imx-parser.mk                      | 2 +-
 package/freescale-imx/imx-vpu/imx-vpu.hash                          | 2 +-
 package/freescale-imx/imx-vpu/imx-vpu.mk                            | 2 +-
 package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash                  | 2 +-
 package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk                    | 2 +-
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash        | 2 +-
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk          | 2 +-
 .../xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash      | 2 +-
 .../x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk  | 2 +-
 22 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.9.3
