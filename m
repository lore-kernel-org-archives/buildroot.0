From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 23:06:41 +0100
Subject: [Buildroot] [git commit] package/imx-mkimage: bump to version
 rel_imx_5.4.70_2.3.0
Message-ID: <20210116214849.527E7874EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75cf8ef19dbc8ff085715f52c9dda1f3a4c72a7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/imx-mkimage/imx-mkimage.hash | 2 +-
 package/imx-mkimage/imx-mkimage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imx-mkimage/imx-mkimage.hash b/package/imx-mkimage/imx-mkimage.hash
index 9ef1a118e2..88fac9bb39 100644
--- a/package/imx-mkimage/imx-mkimage.hash
+++ b/package/imx-mkimage/imx-mkimage.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  482d10bf59dd9ae87ae5e29305e338a35f8fa3bc4ec40c61ada232f682f2358f  imx-mkimage-rel_imx_5.4.47_2.2.0-br1.tar.gz
+sha256  2746136aa5ed79ba24cfbe877d29022a2a33f6614b1bba728e95d1b2f0448196  imx-mkimage-rel_imx_5.4.70_2.3.0-br1.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
index 51eb79e5f5..626e3d873f 100644
--- a/package/imx-mkimage/imx-mkimage.mk
+++ b/package/imx-mkimage/imx-mkimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_MKIMAGE_VERSION = rel_imx_5.4.47_2.2.0
+IMX_MKIMAGE_VERSION = rel_imx_5.4.70_2.3.0
 IMX_MKIMAGE_SITE = https://source.codeaurora.org/external/imx/imx-mkimage
 IMX_MKIMAGE_SITE_METHOD = git
 IMX_MKIMAGE_LICENSE = GPL-2.0+
