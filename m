From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jan 2016 22:55:25 +0100
Subject: [Buildroot] [git commit] configs/sheevaplug: bump u-boot to 2016.01
Message-ID: <20160117220214.5E01B7FDA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=36f8101675259c8e3cfadd95b3f90d148bd3a935
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/sheevaplug_defconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
index bb53789..d6fd3e0 100644
--- a/configs/sheevaplug_defconfig
+++ b/configs/sheevaplug_defconfig
@@ -17,9 +17,10 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="sheevaplug"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sheevaplug"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.01"
 BR2_TARGET_UBOOT_FORMAT_KWB=y
 # BR2_TARGET_UBOOT_NETWORK is not set
 
