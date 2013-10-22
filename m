From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Oct 2013 13:46:40 -0300
Subject: [Buildroot] [PATCH] uboot-tools: fix license issues
Message-ID: <1382460400-3205-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix license directory and filename change, fixes:
http://autobuild.buildroot.net/results/8c9/8c94c81fe74399c854de335329cf4942f8356fbe/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uboot-tools/uboot-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index e19372a..73e1d32 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -8,7 +8,7 @@ UBOOT_TOOLS_VERSION = 2013.10
 UBOOT_TOOLS_SOURCE  = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
-UBOOT_TOOLS_LICENSE_FILES = COPYING
+UBOOT_TOOLS_LICENSE_FILES = Licenses/gpl-2.0.txt
 
 define UBOOT_TOOLS_BUILD_CMDS
 	$(MAKE) -C $(@D) 			\
-- 
1.8.1.5
