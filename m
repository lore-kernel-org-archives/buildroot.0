From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  1 Feb 2016 18:45:35 +0100
Subject: [Buildroot] [PATCH 2/2] configs: qemu_arm_nuri: enable vfp
In-Reply-To: <1454348735-6337-1-git-send-email-romain.naour@gmail.com>
References: <1454348735-6337-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1454348735-6337-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to be abble to select BR2_ARM_FPU_VFPV3D16, BR2_ARM_ENABLE_VFP
must be selected first.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 configs/qemu_arm_nuri_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/qemu_arm_nuri_defconfig b/configs/qemu_arm_nuri_defconfig
index 0854ae0..222f325 100644
--- a/configs/qemu_arm_nuri_defconfig
+++ b/configs/qemu_arm_nuri_defconfig
@@ -2,6 +2,7 @@
 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3D16=y
 
 # System
-- 
2.4.3
