From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 15:38:39 +0100
Subject: [Buildroot] [git commit] imx-vpu: bump to version 5.4.37
Message-ID: <20180107144906.4E1E9802F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fdb1db6c3d529d499295f9150ac32b81997f0d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
- Integrate bug fixes

This patch is based on the following Yocto commit:
https://github.com/Freescale/meta-freescale/commit/b33b15e1

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/imx-vpu/imx-vpu.hash | 2 +-
 package/freescale-imx/imx-vpu/imx-vpu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-vpu/imx-vpu.hash b/package/freescale-imx/imx-vpu/imx-vpu.hash
index b3d617d..0ac0f3d 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.hash
+++ b/package/freescale-imx/imx-vpu/imx-vpu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	e1d6550426dfc59e4fd0352f1d312ea7eff5dcf18974f923ed7a85007cb40e27  imx-vpu-5.4.35.bin
+sha256	ee265e88d17c7369bd9cb917e7cce035b8c7ee2ba4491645fdab9f382f54beb0  imx-vpu-5.4.37.bin
diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
index 0b464d8..e3a1ee6 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.mk
+++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPU_VERSION = 5.4.35
+IMX_VPU_VERSION = 5.4.37
 IMX_VPU_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_SOURCE = imx-vpu-$(IMX_VPU_VERSION).bin
 
