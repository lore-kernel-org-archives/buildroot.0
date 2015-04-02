From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu,  2 Apr 2015 21:34:46 +0200
Subject: [Buildroot] [PATCH] Makefile: add help for linux-update-defconfig
	target
Message-ID: <1428003286-13449-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index edb122b..08b5c1e 100644
--- a/Makefile
+++ b/Makefile
@@ -878,6 +878,8 @@ endif
 ifeq ($(BR2_LINUX_KERNEL),y)
 	@echo '  linux-menuconfig       - Run Linux kernel menuconfig'
 	@echo '  linux-savedefconfig    - Run Linux kernel savedefconfig'
+	@echo '  linux-update-defconfig - Save the Linux configuration to the path specified'
+	@echo '                             by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE'
 endif
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 	@echo '  uclibc-menuconfig      - Run uClibc menuconfig'
-- 
2.1.0
