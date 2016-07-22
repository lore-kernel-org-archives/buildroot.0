From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Fri, 22 Jul 2016 15:18:54 +0200
Subject: [Buildroot] [PATCH] configs: atmel: fix typo in sama5d4 xplained
	development defconfig
Message-ID: <20160722131854.19494-1-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The defconfig file for at91bootstrap was false:
s/sama5d4_xplainedsnf_uboot_secure/sama5d4_xplainednf_uboot_secure.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 configs/atmel_sama5d4_xplained_dev_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/atmel_sama5d4_xplained_dev_defconfig b/configs/atmel_sama5d4_xplained_dev_defconfig
index 0cd8e36..7dadeca 100644
--- a/configs/atmel_sama5d4_xplained_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_dev_defconfig
@@ -93,7 +93,7 @@ BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.5"
-BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d4_xplainedsnf_uboot_secure"
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d4_xplainednf_uboot_secure"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-- 
2.9.0
