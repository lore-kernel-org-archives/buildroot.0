From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Mon,  7 Jan 2019 19:14:35 +0100
Subject: [Buildroot] [PATCH v2 3/6] package/imx-mkimage: Bump to
 rel_imx_4.14.78_1.0.0_ga
In-Reply-To: <20190107181438.23857-1-nerv@dawncrow.de>
References: <20190107181438.23857-1-nerv@dawncrow.de>
Message-ID: <20190107181438.23857-4-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/imx-mkimage/imx-mkimage.hash | 2 +-
 package/imx-mkimage/imx-mkimage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imx-mkimage/imx-mkimage.hash b/package/imx-mkimage/imx-mkimage.hash
index e1cbdd973c..c9dcd0fa1d 100644
--- a/package/imx-mkimage/imx-mkimage.hash
+++ b/package/imx-mkimage/imx-mkimage.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 bc79e11cfbde303e200287fa6624028c8ce5344f8a35ed179b3fe217d74155da  imx-mkimage-rel_imx_4.9.51_8mq_ga.tar.gz
+sha256 d5d7afca6abef4fc6653a2f8b99545d62921a5ab8c44ff3481120232e2162dde  imx-mkimage-rel_imx_4.14.78_1.0.0_ga.tar.gz
 sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  iMX8dv/COPYING
diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
index 6fd6aa39b0..ac22c974ac 100644
--- a/package/imx-mkimage/imx-mkimage.mk
+++ b/package/imx-mkimage/imx-mkimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_MKIMAGE_VERSION = rel_imx_4.9.51_8mq_ga
+IMX_MKIMAGE_VERSION = rel_imx_4.14.78_1.0.0_ga
 IMX_MKIMAGE_SITE = https://source.codeaurora.org/external/imx/imx-mkimage
 IMX_MKIMAGE_SITE_METHOD = git
 IMX_MKIMAGE_LICENSE = GPL-2.0+
-- 
2.17.1
