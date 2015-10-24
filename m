From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Oct 2015 10:49:22 +0200
Subject: [Buildroot] [PATCH 2/2] uboot-tools: bump to 2015.10
In-Reply-To: <1445676562-24568-1-git-send-email-peter@korsgaard.com>
References: <1445676562-24568-1-git-send-email-peter@korsgaard.com>
Message-ID: <1445676562-24568-2-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uboot-tools/uboot-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 5a239ab..6e4d0ed 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2015.07
+UBOOT_TOOLS_VERSION = 2015.10
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
-- 
2.1.4
