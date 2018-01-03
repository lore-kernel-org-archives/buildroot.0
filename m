From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed,  3 Jan 2018 19:38:37 +0100
Subject: [Buildroot] [PATCH 11/16] imx-vpu: bump to version 5.4.37
In-Reply-To: <20180103183842.10182-1-gary.bisson@boundarydevices.com>
References: <20180103183842.10182-1-gary.bisson@boundarydevices.com>
Message-ID: <20180103183842.10182-12-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
- Integrate bug fixes

This patch is based on the following Yocto commit:
https://github.com/Freescale/meta-freescale/commit/b33b15e1

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-vpu/imx-vpu.hash | 2 +-
 package/freescale-imx/imx-vpu/imx-vpu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-vpu/imx-vpu.hash b/package/freescale-imx/imx-vpu/imx-vpu.hash
index b3d617ded9..0ac0f3d0c2 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.hash
+++ b/package/freescale-imx/imx-vpu/imx-vpu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	e1d6550426dfc59e4fd0352f1d312ea7eff5dcf18974f923ed7a85007cb40e27  imx-vpu-5.4.35.bin
+sha256	ee265e88d17c7369bd9cb917e7cce035b8c7ee2ba4491645fdab9f382f54beb0  imx-vpu-5.4.37.bin
diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
index 0b464d854d..e3a1ee661d 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.mk
+++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPU_VERSION = 5.4.35
+IMX_VPU_VERSION = 5.4.37
 IMX_VPU_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_SOURCE = imx-vpu-$(IMX_VPU_VERSION).bin
 
-- 
2.15.1
