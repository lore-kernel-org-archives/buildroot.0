From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Fri,  3 May 2019 16:12:11 +0200
Subject: [Buildroot] [PATCH 1/1] configs/armadeus_apf28_defconfig: bump
 Linux 4.9 version to latest one
Message-ID: <1556892731-10163-1-git-send-email-julien.boibessot@free.fr>
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
index 51e05f5..56351eb 100644
--- a/configs/armadeus_apf28_defconfig
+++ b/configs/armadeus_apf28_defconfig
@@ -13,7 +13,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.64"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.172"
 BR2_LINUX_KERNEL_DEFCONFIG="mxs"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
-- 
2.1.4
