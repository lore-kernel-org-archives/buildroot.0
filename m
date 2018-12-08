From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Dec 2018 23:42:23 +0100
Subject: [Buildroot] [git commit] minnowboard-max: defconfigs: bump kernel
 to 4.19.8
Message-ID: <20181208224028.EC4E086996@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc0f5fc6937b67ccdb04ba291c54c74deec0373d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/minnowboard_max-graphical_defconfig | 4 ++--
 configs/minnowboard_max_defconfig           | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
index f05e791a65..921dae310f 100644
--- a/configs/minnowboard_max-graphical_defconfig
+++ b/configs/minnowboard_max-graphical_defconfig
@@ -3,7 +3,7 @@ BR2_x86_64=y
 BR2_x86_silvermont=y
 
 # Toolchain
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 # needed for TARGET_GRUB2
@@ -23,7 +23,7 @@ BR2_PACKAGE_HOST_MTOOLS=y
 # Linux
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.8"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux.config"
 
diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
index 9495bf3769..523ddffd51 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -7,8 +7,8 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard/post-image.sh"
 
-# Linux headers same as kernel, a 4.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 # Needed for grub2
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 
@@ -23,7 +23,7 @@ BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.8"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux.config"
 
