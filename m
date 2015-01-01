From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Jan 2015 00:02:23 +0100
Subject: [Buildroot] [git commit] defconfigs: bump minnowboard-max kernel to
	3.18.1
Message-ID: <20150101230316.CC8F380810@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e10432a501a5d3b53fd170f2b72fc3865002e70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{linux-3.17.config => linux-3.18.config}       |    0
 configs/minnowboard_max_defconfig                  |   10 +++++-----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/minnowboard-max/linux-3.17.config b/board/minnowboard-max/linux-3.18.config
similarity index 100%
rename from board/minnowboard-max/linux-3.17.config
rename to board/minnowboard-max/linux-3.18.config
diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
index 0cb5b97..e8bd0ab 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -6,10 +6,10 @@ BR2_x86_atom=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard-max/post-build.sh"
 
-# Lock to 3.17 headers to avoid breaking with newer kernels
+# Lock to 3.18 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.17.2"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
+BR2_DEFAULT_KERNEL_VERSION="3.18.1"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Needed for ethernet
 BR2_PACKAGE_LINUX_FIRMWARE=y
@@ -18,9 +18,9 @@ BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard-max/linux-3.17.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard-max/linux-3.18.config"
 
 # Bootloader
 BR2_TARGET_GRUB2=y
