From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 17 Oct 2013 17:10:53 -0300
Subject: [Buildroot] [PATCH 2/2] uboot-tools: bump to version 2013.10
In-Reply-To: <1382040653-17972-1-git-send-email-gustavo@zacarias.com.ar>
References: <1382040653-17972-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1382040653-17972-2-git-send-email-gustavo@zacarias.com.ar>
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
index f8935af..e19372a 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2013.07
+UBOOT_TOOLS_VERSION = 2013.10
 UBOOT_TOOLS_SOURCE  = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
-- 
1.8.1.5
