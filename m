From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 19:15:21 +0100
Subject: [Buildroot] [git commit] configs: qemu_arm_nuri: enable vfp
Message-ID: <20160201224705.9BE5A7F892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18b3481f4d6c9d7baca528d1a8d2cc8f57f2f758
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to be abble to select BR2_ARM_FPU_VFPV3D16, BR2_ARM_ENABLE_VFP
must be selected first.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
