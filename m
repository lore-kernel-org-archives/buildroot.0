From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 19:15:10 +0100
Subject: [Buildroot] [git commit] configs: qemu_arm_vexpress: enable vfp
Message-ID: <20160201224705.56D7D7F90D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec66f6d9e2b4543301930fea5141af4b4ef3d4a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to be abble to select BR2_ARM_FPU_VFPV3D16, BR2_ARM_ENABLE_VFP
must be selected first.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/qemu_arm_vexpress_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 5f1a997..e1808e9 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -2,6 +2,7 @@
 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3D16=y
 
 # System
