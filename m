From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  2 Sep 2015 19:54:13 +0300
Subject: [Buildroot] [PATCH 2/2] imx-vpu: bump to verson 5.4.31
In-Reply-To: <0bc73d48fdc587c9efd46e5d1c18bd1485bc1e28.1441212853.git.baruch@tkos.co.il>
References: <0bc73d48fdc587c9efd46e5d1c18bd1485bc1e28.1441212853.git.baruch@tkos.co.il>
Message-ID: <ee8ba1a5bdeb867d4edcfaef36f3eb5c9ceef54c.1441212853.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also, update license file location, and add a hash file.

Cc: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/freescale-imx/imx-vpu/imx-vpu.hash | 2 ++
 package/freescale-imx/imx-vpu/imx-vpu.mk   | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)
 create mode 100644 package/freescale-imx/imx-vpu/imx-vpu.hash

diff --git a/package/freescale-imx/imx-vpu/imx-vpu.hash b/package/freescale-imx/imx-vpu/imx-vpu.hash
new file mode 100644
index 000000000000..3fdd092e1699
--- /dev/null
+++ b/package/freescale-imx/imx-vpu/imx-vpu.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 a266ab317fbd866541eae506d68983bcd361f49d1162a66bb34cb8088ceec88c imx-vpu-5.4.31.bin
diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
index 599dce85c945..360685755441 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.mk
+++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPU_VERSION = 5.4.27
+IMX_VPU_VERSION = 5.4.31
 IMX_VPU_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_SOURCE = imx-vpu-$(IMX_VPU_VERSION).bin
 
@@ -17,7 +17,7 @@ IMX_VPU_MAKE_ENV = \
 	PLATFORM=$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM)
 
 IMX_VPU_LICENSE = Freescale Semiconductor Software License Agreement
-IMX_VPU_LICENSE_FILES = EULA vpu/EULA.txt
+IMX_VPU_LICENSE_FILES = EULA COPYING
 IMX_VPU_REDISTRIBUTE = NO
 
 define IMX_VPU_EXTRACT_CMDS
-- 
2.5.0
