From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 18:44:02 +0200
Subject: [Buildroot] [git commit] configs/zynq_*_defconfig: enable VFP
	support
Message-ID: <20161015164431.9F412805F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5f8c99aac7c4efe8b6a651a977aa05719a57709
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The A9 cores inside the Xilinx Zynq have a VFP unit, so enable it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/zynq_microzed_defconfig | 1 +
 configs/zynq_zc706_defconfig    | 1 +
 configs/zynq_zed_defconfig      | 1 +
 3 files changed, 3 insertions(+)

diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index 5efc0d4..ca6d010 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
 BR2_LINUX_KERNEL=y
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 578f042..6f7215c 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -2,6 +2,7 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
+BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
 BR2_LINUX_KERNEL=y
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index 7ce3365..e5bf3de 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
 BR2_LINUX_KERNEL=y
