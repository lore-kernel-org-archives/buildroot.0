From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Wed, 26 Dec 2018 23:31:09 +0100
Subject: [Buildroot] [PATCH 6/9] package/imx-mkimage: Bump to
 imx_4.14.62_1.0.0_beta
In-Reply-To: <20181226223112.24456-1-nerv@dawncrow.de>
References: <20181226223112.24456-1-nerv@dawncrow.de>
Message-ID: <20181226223112.24456-6-nerv@dawncrow.de>
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
index e1cbdd973c..ceaac64b1c 100644
--- a/package/imx-mkimage/imx-mkimage.hash
+++ b/package/imx-mkimage/imx-mkimage.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 bc79e11cfbde303e200287fa6624028c8ce5344f8a35ed179b3fe217d74155da  imx-mkimage-rel_imx_4.9.51_8mq_ga.tar.gz
+sha256 17e22d0127879bb9f6f3aae82b22d02e0372578dc7a4f6c71647fce75c632ee2  imx-mkimage-rel_imx_4.14.62_1.0.0_beta.tar.gz
 sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  iMX8dv/COPYING
diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
index 6fd6aa39b0..cde4fefcea 100644
--- a/package/imx-mkimage/imx-mkimage.mk
+++ b/package/imx-mkimage/imx-mkimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_MKIMAGE_VERSION = rel_imx_4.9.51_8mq_ga
+IMX_MKIMAGE_VERSION = rel_imx_4.14.62_1.0.0_beta
 IMX_MKIMAGE_SITE = https://source.codeaurora.org/external/imx/imx-mkimage
 IMX_MKIMAGE_SITE_METHOD = git
 IMX_MKIMAGE_LICENSE = GPL-2.0+
-- 
2.17.1
