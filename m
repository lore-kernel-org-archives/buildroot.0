From: Julien Olivain <juju@cotds.org>
Date: Mon,  2 Dec 2019 21:06:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/imx-mkimage: bump to
 rel_imx_4.14.98_2.0.0_ga
Message-ID: <20191202200635.418349-1-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch update the imx-mkimage package to version
rel_imx_4.14.98_2.0.0_ga.

Signed-off-by: Julien Olivain <juju@cotds.org>
---
 package/imx-mkimage/imx-mkimage.hash | 2 +-
 package/imx-mkimage/imx-mkimage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imx-mkimage/imx-mkimage.hash b/package/imx-mkimage/imx-mkimage.hash
index 1c00a78904..e75619b8d4 100644
--- a/package/imx-mkimage/imx-mkimage.hash
+++ b/package/imx-mkimage/imx-mkimage.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 d5d7afca6abef4fc6653a2f8b99545d62921a5ab8c44ff3481120232e2162dde  imx-mkimage-rel_imx_4.14.78_1.0.0_ga.tar.gz
+sha256 ceeb297bb0aee02d7b105ee245d00f3cafd74fc73ef0c6182b058b234d5bbbd7  imx-mkimage-rel_imx_4.14.98_2.0.0_ga.tar.gz
 sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
index c2a4379b44..a58ddf07b7 100644
--- a/package/imx-mkimage/imx-mkimage.mk
+++ b/package/imx-mkimage/imx-mkimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_MKIMAGE_VERSION = rel_imx_4.14.78_1.0.0_ga
+IMX_MKIMAGE_VERSION = rel_imx_4.14.98_2.0.0_ga
 IMX_MKIMAGE_SITE = https://source.codeaurora.org/external/imx/imx-mkimage
 IMX_MKIMAGE_SITE_METHOD = git
 IMX_MKIMAGE_LICENSE = GPL-2.0+
-- 
2.23.0
