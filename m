From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 25 Jul 2018 17:01:44 +0200
Subject: [Buildroot] [PATCH 3/8] imx-vpu-cnm: bump version to 5.4.38
In-Reply-To: <20180725150149.30774-1-gary.bisson@boundarydevices.com>
References: <20180725150149.30774-1-gary.bisson@boundarydevices.com>
Message-ID: <20180725150149.30774-4-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No changelog provided by NXP.
Added COPYING hash value to track license changes.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-vpu-cnm/imx-vpu-cnm.hash | 3 ++-
 package/freescale-imx/imx-vpu-cnm/imx-vpu-cnm.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-vpu-cnm/imx-vpu-cnm.hash b/package/freescale-imx/imx-vpu-cnm/imx-vpu-cnm.hash
index 0ac0f3d0c2..822286dceb 100644
--- a/package/freescale-imx/imx-vpu-cnm/imx-vpu-cnm.hash
+++ b/package/freescale-imx/imx-vpu-cnm/imx-vpu-cnm.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256	ee265e88d17c7369bd9cb917e7cce035b8c7ee2ba4491645fdab9f382f54beb0  imx-vpu-5.4.37.bin
+sha256  34bed0ddf6c797f444bddfa5d5495adc751ff268b6431d8beb48129c89c9e47f  imx-vpu-5.4.38.bin
+sha256  78696664f7afe7f2b081c99af60082d6403fab935b1b10056ed41aec123ff7fa  COPYING
diff --git a/package/freescale-imx/imx-vpu-cnm/imx-vpu-cnm.mk b/package/freescale-imx/imx-vpu-cnm/imx-vpu-cnm.mk
index a6cca08e9c..d29eb0ed2c 100644
--- a/package/freescale-imx/imx-vpu-cnm/imx-vpu-cnm.mk
+++ b/package/freescale-imx/imx-vpu-cnm/imx-vpu-cnm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPU_CNM_VERSION = 5.4.37
+IMX_VPU_CNM_VERSION = 5.4.38
 IMX_VPU_CNM_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_CNM_SOURCE = imx-vpu-$(IMX_VPU_CNM_VERSION).bin
 
-- 
2.18.0
