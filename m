From: Philippe Reynes <tremyfr@yahoo.fr>
Date: Sat,  8 Feb 2014 11:56:24 +0100
Subject: [Buildroot] [PATCH] apf27: bump kernel version to 3.13.2
Message-ID: <1391856984-23513-1-git-send-email-tremyfr@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Philippe Reynes <tremyfr@yahoo.fr>
---
 .../apf27/{linux-3.12.config => linux-3.13.config} |    0
 configs/armadeus_apf27_defconfig                   |    6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename board/armadeus/apf27/{linux-3.12.config => linux-3.13.config} (100%)

diff --git a/board/armadeus/apf27/linux-3.12.config b/board/armadeus/apf27/linux-3.13.config
similarity index 100%
rename from board/armadeus/apf27/linux-3.12.config
rename to board/armadeus/apf27/linux-3.13.config
diff --git a/configs/armadeus_apf27_defconfig b/configs/armadeus_apf27_defconfig
index 0e2fb76..26f313e 100644
--- a/configs/armadeus_apf27_defconfig
+++ b/configs/armadeus_apf27_defconfig
@@ -4,7 +4,7 @@ BR2_arm926t=y
 
 # Lock down headers to avoid breaking with new defaults
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.7"
+BR2_DEFAULT_KERNEL_VERSION="3.13.2"
 
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf27"
@@ -20,9 +20,9 @@ BR2_TARGET_ROOTFS_UBI=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf27/linux-3.12.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf27/linux-3.13.config"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0xA0008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx27-apf27dev"
-- 
1.7.4.4
