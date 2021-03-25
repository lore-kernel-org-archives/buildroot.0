From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Thu, 25 Mar 2021 07:21:36 +0100
Subject: [Buildroot] [PATCH v3 0/5] imx: add i.MX 8M Plus SoC & 8MPlus EVK
 board support
Message-ID: <20210325062141.10226-1-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds support for the NXP i.MX 8M Plus SoC and EVK board.

Stephane Viau (5):
  package/freescale-imx: add option for i.MX 8M Plus
  package/freescale-imx/firmware-imx: add support for i.MX 8M Plus
  package/imx-mkimage: add support for i.MX 8M Plus
  board/freescale/common/imx: add support for i.MX 8M Plus
  configs/freescale_imx8mpevk: new defconfig

 DEVELOPERS                                    |  2 +
 .../common/imx/imx8-bootloader-prepare.sh     |  7 ++
 board/freescale/common/imx/post-image.sh      |  2 +
 board/freescale/imx8mpevk/readme.txt          | 71 +++++++++++++++++++
 configs/freescale_imx8mpevk_defconfig         | 42 +++++++++++
 package/freescale-imx/Config.in               |  8 ++-
 package/freescale-imx/firmware-imx/Config.in  |  2 +
 package/imx-mkimage/imx-mkimage.mk            |  2 +-
 8 files changed, 134 insertions(+), 2 deletions(-)
 create mode 100644 board/freescale/imx8mpevk/readme.txt
 create mode 100644 configs/freescale_imx8mpevk_defconfig

-- 
2.31.0
