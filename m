From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 16 Sep 2016 15:09:02 +0200
Subject: [Buildroot] [PATCH] configs: nitrogen*: enable NEON support
Message-ID: <20160916130902.23091-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 configs/nitrogen6sx_defconfig | 3 +++
 configs/nitrogen6x_defconfig  | 3 +++
 configs/nitrogen7_defconfig   | 1 +
 3 files changed, 7 insertions(+)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index bd92f55..1df658b 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -1,6 +1,9 @@
 # architecture
 BR2_arm=y
 BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_NEON=y
 
 # system
 BR2_TARGET_GENERIC_GETTY=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 85acabe..d8775f3 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -1,6 +1,9 @@
 # architecture
 BR2_arm=y
 BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_NEON=y
 
 # system
 BR2_TARGET_GENERIC_GETTY=y
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index a8f3b45..adce0fb 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -1,6 +1,7 @@
 # architecture
 BR2_arm=y
 BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
 
 # system
 BR2_TARGET_GENERIC_GETTY=y
-- 
2.9.3
