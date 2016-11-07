From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Mon,  7 Nov 2016 16:58:04 +0100
Subject: [Buildroot] [PATCH] board/armadeus: bump apf28 kernel version to
	4.4.30 (latest LTS)
Message-ID: <1478534284-5585-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien BOIBESSOT <julien.boibessot@armadeus.com>

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 configs/armadeus_apf28_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/armadeus_apf28_defconfig b/configs/armadeus_apf28_defconfig
index 708f20b..31fb528 100644
--- a/configs/armadeus_apf28_defconfig
+++ b/configs/armadeus_apf28_defconfig
@@ -13,7 +13,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.22"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.30"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf28/linux-4.4.config"
 BR2_LINUX_KERNEL_UIMAGE=y
-- 
2.1.4
