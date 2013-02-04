From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Feb 2013 09:25:17 -0300
Subject: [Buildroot] [PATCH] uboot-tools: also bump to 2013.01.01
Message-ID: <1359980717-9587-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uboot-tools/uboot-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 3470b60..9d7596a 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -3,7 +3,7 @@
 # uboot-tools
 #
 #############################################################
-UBOOT_TOOLS_VERSION = 2013.01
+UBOOT_TOOLS_VERSION = 2013.01.01
 UBOOT_TOOLS_SOURCE  = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
-- 
1.7.12.4
