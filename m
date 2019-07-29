From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Mon, 29 Jul 2019 15:28:32 +0200
Subject: [Buildroot] [PATCH 1/1] board/armadeus/apf51: bump 4.4 LTS kernel
 to latest version
Message-ID: <1564406912-5398-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien BOIBESSOT <julien.boibessot@armadeus.com>

This should fix: https://gitlab.com/buildroot.org/buildroot/-/jobs/259847033

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 configs/armadeus_apf51_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/armadeus_apf51_defconfig b/configs/armadeus_apf51_defconfig
index e834626..26b6a44 100644
--- a/configs/armadeus_apf51_defconfig
+++ b/configs/armadeus_apf51_defconfig
@@ -13,7 +13,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc2"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.30"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.186"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf51/linux-4.4.config"
 BR2_LINUX_KERNEL_UIMAGE=y
-- 
2.1.4
