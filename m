From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 15 Jun 2017 18:18:14 +0200
Subject: [Buildroot] [PATCH 1/4] zynq_zc706: remove duplicated line in
	defconfig
Message-ID: <1497543497-17938-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
---
 configs/zynq_zc706_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 3f7fd8c4f21d..1317655b3740 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -2,7 +2,6 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
 BR2_LINUX_KERNEL=y
-- 
2.7.4
