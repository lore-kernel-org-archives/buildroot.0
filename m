From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 23:00:35 +0200
Subject: [Buildroot] [git commit] package/imx-usb-loader: bump version to
 30b43d6
Message-ID: <20200617205900.4D5AA7FA52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f97a1cf49fb54c59903173feb1e88da0428455f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump version to get i.MX8M Nano support.

Changes sinces 4aa9809:

  30b43d6 (HEAD -> master, origin/master, origin/HEAD) Fix MinGW Build (#114)
  25d6c0d mx8m_usb_sdp_spl: create generic sdp spl config for all imx8m
  dc0fb26 mx8mn_usb_sdp_spl.conf: initial addition
  f009770 imx_sdp: don't try to load hdmi firmware
  c5c4d28 add SPDS protocol support, imx8mn(nano)
  15dbbd7 tests: add pid 0x1001
  353791c tests: add pids 0x0134/0x1000
  06fb581 tests: pid=0x0080 is for mx6ull
  6b07a0a mx8mm_usb_sdp_spl.conf/ mx8mm_usb_work.conf: s/imx-mkimage/u-boot-imx6/
  b00b0e2 mx8mq_usb_work.conf: load flash.bin from u-boot-imx6 directory
  bda7ab6 add mx8mq_usb_sdp_spl.conf
  7984efc Moving libusb_free_device_list to get imx_usb to work on Windows.
  29fa8ab imx_usb: use device found by find_imx_device
  abe7f5d add support for relocatable installs
  3d36c83 Fixed build for Visual Studio 2015 Express.
  fe50624 imx_usb.config: add mx8mm_usb_sdp_spl.conf/mx8mm_usb_work.conf lines
  f7752f4 mx8mq_usb_work.conf: use bl31-iMX8MQ-2g.bin to match branch boundary-imx_4.9.123_imx8mm_ga of imx-mkimage
  8c9eee7 add mx8mm config files

Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/imx-usb-loader/imx-usb-loader.hash | 2 +-
 package/imx-usb-loader/imx-usb-loader.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imx-usb-loader/imx-usb-loader.hash b/package/imx-usb-loader/imx-usb-loader.hash
index 182116a25f..7e1c097143 100644
--- a/package/imx-usb-loader/imx-usb-loader.hash
+++ b/package/imx-usb-loader/imx-usb-loader.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  5a17886042c09f0f16093031183a287a2a7ae0fa9cd8bdfa31e7b31cb92510d9  imx-usb-loader-4aa9809099dcece9a9225776321f3b4b5b896d78.tar.gz
+sha256  4357907c9669874d3ccbf00395bf0b1733c26e6daea85d721f1c0cd897f4162c  imx-usb-loader-30b43d69770cd69e84c045dc9dcabb1f3e9d975a.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/imx-usb-loader/imx-usb-loader.mk b/package/imx-usb-loader/imx-usb-loader.mk
index 594bbb9ca1..1a09486928 100644
--- a/package/imx-usb-loader/imx-usb-loader.mk
+++ b/package/imx-usb-loader/imx-usb-loader.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_USB_LOADER_VERSION = 4aa9809099dcece9a9225776321f3b4b5b896d78
+IMX_USB_LOADER_VERSION = 30b43d69770cd69e84c045dc9dcabb1f3e9d975a
 
 IMX_USB_LOADER_SITE = $(call github,boundarydevices,imx_usb_loader,$(IMX_USB_LOADER_VERSION))
 IMX_USB_LOADER_LICENSE = LGPL-2.1+
