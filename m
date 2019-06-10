From: Julien Olivain <juju@cotds.org>
Date: Mon, 10 Jun 2019 12:19:19 +0200
Subject: [Buildroot] [PATCH 0/5] configs/imx8mmpico: new defconfig
Message-ID: <20190610101924.9124-1-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series add support for i.MX8M Mini SoC and a new defconfig
for the Technexion i.MX8M Mini Pico board.

Julien Olivain (5):
  package/freescale-imx: add option for i.MX8MM
  package/freescale-imx/firmware-imx: add support for i.MX8MM
  package/imx-mkimage: add support for i.MX8MM
  board/freescale/common/imx: add support for i.MX8MM
  configs/imx8mmpico: new defconfig

 .gitlab-ci.yml                                |  1 +
 DEVELOPERS                                    |  2 +
 .../common/imx/imx8-bootloader-prepare.sh     |  7 ++
 board/freescale/common/imx/post-image.sh      |  4 +
 board/technexion/imx8mmpico/readme.txt        | 96 +++++++++++++++++++
 configs/imx8mmpico_defconfig                  | 39 ++++++++
 package/freescale-imx/Config.in               |  6 +-
 .../firmware-imx/firmware-imx.mk              |  2 +-
 package/imx-mkimage/imx-mkimage.mk            |  2 +-
 9 files changed, 156 insertions(+), 3 deletions(-)
 create mode 100644 board/technexion/imx8mmpico/readme.txt
 create mode 100644 configs/imx8mmpico_defconfig

-- 
2.21.0
