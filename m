From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Mar 2019 23:27:11 +0100
Subject: [Buildroot] [git commit] package/imx-mkimage: fix license file
Message-ID: <20190305222446.C66DD7FCA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9550765adbbfeb2a3ca67a7963d5bf872a60c37b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

COPYING file is now at the top level, see:
https://source.codeaurora.org/external/imx/imx-mkimage/commit/?id=4a7e6873dc9de70f61dcbdb9c15a945a2e31d272

Fixes:
 - http://autobuild.buildroot.org/results/03cffcf6959d5a6efa05b6e3c71d95d096cc942a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/imx-mkimage/imx-mkimage.hash | 2 +-
 package/imx-mkimage/imx-mkimage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imx-mkimage/imx-mkimage.hash b/package/imx-mkimage/imx-mkimage.hash
index c9dcd0fa1d..1c00a78904 100644
--- a/package/imx-mkimage/imx-mkimage.hash
+++ b/package/imx-mkimage/imx-mkimage.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256 d5d7afca6abef4fc6653a2f8b99545d62921a5ab8c44ff3481120232e2162dde  imx-mkimage-rel_imx_4.14.78_1.0.0_ga.tar.gz
-sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  iMX8dv/COPYING
+sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
index 06d3157dc1..9f8e7d2d01 100644
--- a/package/imx-mkimage/imx-mkimage.mk
+++ b/package/imx-mkimage/imx-mkimage.mk
@@ -8,7 +8,7 @@ IMX_MKIMAGE_VERSION = rel_imx_4.14.78_1.0.0_ga
 IMX_MKIMAGE_SITE = https://source.codeaurora.org/external/imx/imx-mkimage
 IMX_MKIMAGE_SITE_METHOD = git
 IMX_MKIMAGE_LICENSE = GPL-2.0+
-IMX_MKIMAGE_LICENSE_FILES = iMX8dv/COPYING
+IMX_MKIMAGE_LICENSE_FILES = COPYING
 HOST_IMX_MKIMAGE_DEPENDENCIES = host-zlib
 
 ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M),y)
