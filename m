From: Dan Riegsecker <1baldgeek@gmail.com>
Date: Tue,  4 Sep 2018 17:28:22 -0400
Subject: [Buildroot] [PATCH] imx-lib: bump to version used in 4.9.88-2.0.0_ga
Message-ID: <20180904212822.48852-1-1baldgeek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the latest release from NXP, Yocto Rocko 4.9.88-2.0.0_ga,
imx-lib was switched from a specific branch or tag release to the
master branch and a specific commit. See the link below for
reference.

https://source.codeaurora.org/external/imx/meta-fsl-bsp-release/commit/?h=rocko-4.9.88-2.0.0_ga&id=ded1a9ea3d723c56058524fc9ebd420a3510ae05

Signed-off-by: Dan Riegsecker <1baldgeek@gmail.com>
---
 package/freescale-imx/imx-lib/imx-lib.hash | 2 +-
 package/freescale-imx/imx-lib/imx-lib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-lib/imx-lib.hash b/package/freescale-imx/imx-lib/imx-lib.hash
index b3fce59d53..abbf017459 100644
--- a/package/freescale-imx/imx-lib/imx-lib.hash
+++ b/package/freescale-imx/imx-lib/imx-lib.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256 245ace9b2c50d6c13a804d9c4492a5a850c626e7537f0d0bad81670b2824892f  imx-lib-rel_imx_4.9.x_1.0.0_ga.tar.gz
+sha256 ced5ad0a179887ef1dd93e8103a9ab7372017cc1c241d28cded164cdece4b918  imx-lib-3f777974c0c146817e2ff5cb0340ca66a1f99e57.tar.gz
diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
index e82368588d..721c20e5f8 100644
--- a/package/freescale-imx/imx-lib/imx-lib.mk
+++ b/package/freescale-imx/imx-lib/imx-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_LIB_VERSION = rel_imx_4.9.x_1.0.0_ga
+IMX_LIB_VERSION = 3f777974c0c146817e2ff5cb0340ca66a1f99e57
 IMX_LIB_SITE = https://source.codeaurora.org/external/imx/imx-lib
 IMX_LIB_SITE_METHOD = git
 IMX_LIB_LICENSE = LGPL-2.1+
-- 
2.11.0
