From: Gregory Hermant <gregory.hermant@calao-systems.com>
Date: Mon, 29 Oct 2012 09:41:08 +0100
Subject: [Buildroot] [PATCH 1/6] Add config file for the snowball board
In-Reply-To: <1351500073-4351-1-git-send-email-gregory.hermant@calao-systems.com>
References: <1351500073-4351-1-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <1351500073-4351-2-git-send-email-gregory.hermant@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
---
 configs/calao_snowball_defconfig |   52 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 configs/calao_snowball_defconfig

diff --git a/configs/calao_snowball_defconfig b/configs/calao_snowball_defconfig
new file mode 100644
index 0000000..68f0a51
--- /dev/null
+++ b/configs/calao_snowball_defconfig
@@ -0,0 +1,52 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA2"
+BR2_PACKAGE_BUSYBOX_CONFIG="board/calao/snowball/busybox-1.20.x.config"
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_BZIP2=y
+BR2_PACKAGE_FBSET=y
+BR2_PACKAGE_FBTERM=y
+BR2_PACKAGE_FBV=y
+BR2_PACKAGE_QT=y
+BR2_PACKAGE_QT_DEMOS=y
+BR2_PACKAGE_QT_LICENSE_APPROVED=y
+BR2_PACKAGE_QT_MOUSE_PC=y
+BR2_PACKAGE_QT_MOUSE_LINUXTP=y
+BR2_PACKAGE_QT_MOUSE_LINUXINPUT=y
+BR2_PACKAGE_QT_MOUSE_TSLIB=y
+BR2_PACKAGE_MINICOM=y
+BR2_PACKAGE_LUA=y
+BR2_PACKAGE_OPENSSL=y
+BR2_PACKAGE_SQLITE=y
+BR2_PACKAGE_LIBELF=y
+BR2_PACKAGE_PCRE=y
+BR2_PACKAGE_LIBXML2=y
+BR2_PACKAGE_HDMISERVICE=y
+BR2_PACKAGE_SNOWBALL_FIRMWARE=y
+BR2_PACKAGE_SNOWBALL_INIT=y
+BR2_PACKAGE_BLUEZ_UTILS=y
+BR2_PACKAGE_IW=y
+BR2_PACKAGE_WGET=y
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WIRELESS_TOOLS_LIB=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_EAP=y
+BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
+BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
+BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=y
+BR2_PACKAGE_WPA_SUPPLICANT_WPS=y
+BR2_TARGET_ROOTFS_TAR_GZIP=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="u8500_snowball"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://igloocommunity.org/git/boot/u-boot-ux500.git"
+BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="master"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://igloocommunity.org/git/kernel/igloo-kernel.git"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="stable-linux-ux500-3.4"
+BR2_LINUX_KERNEL_PATCH="board/calao/snowball/linux-3.4.patch"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/calao/snowball/linux-3.4.config"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
1.7.9.5
