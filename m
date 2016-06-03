From: Andrew Webster <awebster@arcx.com>
Date: Fri, 3 Jun 2016 09:12:42 -0400
Subject: [Buildroot] [PATCH 09/10] imx-lib: bump version to 5.4
In-Reply-To: <cover.1464958470.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
Message-ID: <7cd0c667d759ea496e55a9cfd2409dbf39e1772e.1464958470.git.awebster@arcx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
- Remove platform check in hdmi-cec and imx-lib - simplify to support builds
on multiple machines
- For ipu use the dummy defaul object to fix build issues on non-ipu hardware

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/7946533

Signed-off-by: Andrew Webster <awebster@arcx.com>
---
 package/freescale-imx/imx-lib/imx-lib.hash | 2 +-
 package/freescale-imx/imx-lib/imx-lib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-lib/imx-lib.hash b/package/freescale-imx/imx-lib/imx-lib.hash
index 8e4bd73..76dcb23 100644
--- a/package/freescale-imx/imx-lib/imx-lib.hash
+++ b/package/freescale-imx/imx-lib/imx-lib.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256 2b4547ffb1de328cf8997a09a423c6f015d808493efd11a98a5d42c6497e3445  imx-lib-5.1.tar.gz
+sha256 8d12c4a0a44d29569f1ead3a36adc28402b9c4036b53e11dd3ebf2295e3ce1d0  imx-lib-5.4.tar.gz
diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
index b49357b..d3603ca 100644
--- a/package/freescale-imx/imx-lib/imx-lib.mk
+++ b/package/freescale-imx/imx-lib/imx-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_LIB_VERSION = 5.1
+IMX_LIB_VERSION = 5.4
 IMX_LIB_SITE = $(FREESCALE_IMX_SITE)
 IMX_LIB_LICENSE = LGPLv2.1+
 IMX_LIB_LICENSE_FILES = COPYING-LGPL-2.1
-- 
1.9.1
