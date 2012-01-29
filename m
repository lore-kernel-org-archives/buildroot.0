From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 29 Jan 2012 16:11:48 +0100
Subject: [Buildroot] [RFC 15/15] Create a test config (testing only)
In-Reply-To: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1327849908-15588-16-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is for testing only, not to be committed in any serious repository

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 configs/legal_info_test_defconfig |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 configs/legal_info_test_defconfig

diff --git a/configs/legal_info_test_defconfig b/configs/legal_info_test_defconfig
new file mode 100644
index 0000000..ccb2df8
--- /dev/null
+++ b/configs/legal_info_test_defconfig
@@ -0,0 +1,13 @@
+BR2_x86_pentiumpro=y
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+BR2_PACKAGE_BZIP2=y
+BR2_PACKAGE_LZOP=y
+BR2_PACKAGE_DIRECTFB=y
+BR2_PACKAGE_IOSTAT=y
+BR2_PACKAGE_KBD=y
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.2.config"
-- 
1.7.5.4
