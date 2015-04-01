From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 22:43:18 +0200
Subject: [Buildroot] [git commit] configs: drop largefile option
Message-ID: <20150401205855.E387D8191D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d79275093547caf986fa644e88a4d0208cac722c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop the buildroot toolchain non-largefile support option since it's
being removed.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/armadeus_apf9328_defconfig |    1 -
 configs/raspberrypi2_defconfig     |    1 -
 configs/raspberrypi_defconfig      |    1 -
 3 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/configs/armadeus_apf9328_defconfig b/configs/armadeus_apf9328_defconfig
index 3600199..3ad8feb 100644
--- a/configs/armadeus_apf9328_defconfig
+++ b/configs/armadeus_apf9328_defconfig
@@ -6,7 +6,6 @@ BR2_arm920t=y
 BR2_PACKAGE_GDB=y
 BR2_PACKAGE_HOST_GDB=y
 BR2_ENABLE_LOCALE_PURGE=y
-BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
 BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
 BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
 BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index b523a4a..4d4944f 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -3,7 +3,6 @@ BR2_cortex_a7=y
 BR2_ARM_EABIHF=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 835657c..f9b8a1c 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -1,7 +1,6 @@
 BR2_arm=y
 BR2_arm1176jzf_s=y
 
-BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
