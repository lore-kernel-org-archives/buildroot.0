From: Dan Riegsecker <1baldgeek@gmail.com>
Date: Fri, 31 Aug 2018 13:44:08 -0400
Subject: [Buildroot] [PATCH] imx-vpu: bump to version 5.4.38
Message-ID: <8767305f-2849-6fc9-49e0-422fa43e82eb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is based on what was released by NXP with image version
4.9.88-2.0.0.

This patch also corresponds with the Yocto equivalent:
https://github.com/Freescale/meta-freescale/commit/1594c64

Signed-off-by: Dan Riegsecker <1baldgeek@gmail.com>
---
 ?package/freescale-imx/imx-vpu/imx-vpu.hash | 2 +-
 ?package/freescale-imx/imx-vpu/imx-vpu.mk?? | 2 +-
 ?2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-vpu/imx-vpu.hash 
b/package/freescale-imx/imx-vpu/imx-vpu.hash
index 0ac0f3d0c2..34abdc099c 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.hash
+++ b/package/freescale-imx/imx-vpu/imx-vpu.hash
@@ -1,2 +1,2 @@
 ?# Locally computed
-sha256 ee265e88d17c7369bd9cb917e7cce035b8c7ee2ba4491645fdab9f382f54beb0 
imx-vpu-5.4.37.bin
+sha256 34bed0ddf6c797f444bddfa5d5495adc751ff268b6431d8beb48129c89c9e47f 
imx-vpu-5.4.38.bin
diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk 
b/package/freescale-imx/imx-vpu/imx-vpu.mk
index 2bcfe53eba..e30237508e 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.mk
+++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
@@ -4,7 +4,7 @@
 ?#
 ?################################################################################

-IMX_VPU_VERSION = 5.4.37
+IMX_VPU_VERSION = 5.4.38
 ?IMX_VPU_SITE = $(FREESCALE_IMX_SITE)
 ?IMX_VPU_SOURCE = imx-vpu-$(IMX_VPU_VERSION).bin

-- 
2.11.0
