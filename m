From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 31 Jul 2013 08:06:37 -0300
Subject: [Buildroot] [PATCH 2/2] uboot-tools: bump to version 2013.07
In-Reply-To: <1375268797-11457-1-git-send-email-gustavo@zacarias.com.ar>
References: <1375268797-11457-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1375268797-11457-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...gh-from-tools.patch => uboot-tools-01-drop-configh-from-tools.patch} | 0
 ...-override-fix.patch => uboot-tools-02-hostcflags-override-fix.patch} | 0
 package/uboot-tools/uboot-tools.mk                                      | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename package/uboot-tools/{uboot-tools-drop-configh-from-tools.patch => uboot-tools-01-drop-configh-from-tools.patch} (100%)
 rename package/uboot-tools/{uboot-tools-hostcflags-override-fix.patch => uboot-tools-02-hostcflags-override-fix.patch} (100%)

diff --git a/package/uboot-tools/uboot-tools-drop-configh-from-tools.patch b/package/uboot-tools/uboot-tools-01-drop-configh-from-tools.patch
similarity index 100%
rename from package/uboot-tools/uboot-tools-drop-configh-from-tools.patch
rename to package/uboot-tools/uboot-tools-01-drop-configh-from-tools.patch
diff --git a/package/uboot-tools/uboot-tools-hostcflags-override-fix.patch b/package/uboot-tools/uboot-tools-02-hostcflags-override-fix.patch
similarity index 100%
rename from package/uboot-tools/uboot-tools-hostcflags-override-fix.patch
rename to package/uboot-tools/uboot-tools-02-hostcflags-override-fix.patch
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index ceda3c5..f8935af 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2013.04
+UBOOT_TOOLS_VERSION = 2013.07
 UBOOT_TOOLS_SOURCE  = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
-- 
1.8.1.5
