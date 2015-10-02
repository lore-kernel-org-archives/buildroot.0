From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Oct 2015 20:08:03 +0100
Subject: [Buildroot] [git commit] imx-vpu: bump to version 5.4.31
Message-ID: <20151002190830.B12FC8082B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=15cb0fa3d9a79d4df0ff2022f3925b3ee3c3f21d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also, update license file location, and add a hash file.

[Thomas: fix typo in commit title.]

Cc: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/imx-vpu/imx-vpu.hash |    2 ++
 package/freescale-imx/imx-vpu/imx-vpu.mk   |    4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-vpu/imx-vpu.hash b/package/freescale-imx/imx-vpu/imx-vpu.hash
new file mode 100644
index 0000000..3fdd092
--- /dev/null
+++ b/package/freescale-imx/imx-vpu/imx-vpu.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 a266ab317fbd866541eae506d68983bcd361f49d1162a66bb34cb8088ceec88c imx-vpu-5.4.31.bin
diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
index 599dce8..3606857 100644
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
