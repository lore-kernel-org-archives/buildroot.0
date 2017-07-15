From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jul 2017 23:16:36 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi0_defconfig: bump
	kernel version to 4.9.36
Message-ID: <20170715211248.BD41281F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3aed1afd3578f52623ff588d5cf1060fceedb600
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/raspberrypi0_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index 10947b8..c193d89 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -10,7 +10,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="5e4ee836560d4c0371e109bf469e1ad808ae7a44"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9126e25b0934bd7bd843763310ea4b34c6e139d0"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B from the kernel sources: the zero is the same
