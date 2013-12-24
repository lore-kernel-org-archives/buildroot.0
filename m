From: Philippe Reynes <tremyfr@yahoo.fr>
Date: Tue, 24 Dec 2013 18:07:05 +0100
Subject: [Buildroot] [PATCH] apf27: bump kernel version to 3.12.6
Message-ID: <1387904825-31005-1-git-send-email-tremyfr@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Philippe Reynes <tremyfr@yahoo.fr>
---
 configs/armadeus_apf27_defconfig |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/armadeus_apf27_defconfig b/configs/armadeus_apf27_defconfig
index 409476f..21af2fb 100644
--- a/configs/armadeus_apf27_defconfig
+++ b/configs/armadeus_apf27_defconfig
@@ -4,7 +4,7 @@ BR2_arm926t=y
 
 # Lock down headers to avoid breaking with new defaults
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.5"
+BR2_DEFAULT_KERNEL_VERSION="3.12.6"
 
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf27"
@@ -20,7 +20,7 @@ BR2_TARGET_ROOTFS_UBI=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf27/linux-3.12.config"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0xA0008000"
-- 
1.7.4.4
