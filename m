From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 12:36:18 +0200
Subject: [Buildroot] [git commit] configs: nitrogen*: enable VFP and NEON
	support
Message-ID: <20160917103624.E860E81E1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=341bc36d22f82ef3dcf4ec25d34aeb362c372b59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/nitrogen6sx_defconfig | 3 +++
 configs/nitrogen6x_defconfig  | 3 +++
 configs/nitrogen7_defconfig   | 1 +
 3 files changed, 7 insertions(+)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index bd92f55..b317525 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -1,6 +1,9 @@
 # architecture
 BR2_arm=y
 BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
 
 # system
 BR2_TARGET_GENERIC_GETTY=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 85acabe..dc033dc 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -1,6 +1,9 @@
 # architecture
 BR2_arm=y
 BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
 
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
