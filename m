From: Axel Lin <axel.lin@ingics.com>
Date: Sat, 05 Oct 2013 22:59:03 +0800
Subject: [Buildroot] [PATCH] enchant: bump to version 1.6.0
Message-ID: <1380985143.4554.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/enchant/enchant.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/enchant/enchant.mk b/package/enchant/enchant.mk
index 8a76c6b..977c37b 100644
--- a/package/enchant/enchant.mk
+++ b/package/enchant/enchant.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENCHANT_VERSION = 1.5.0
+ENCHANT_VERSION = 1.6.0
 ENCHANT_SOURCE = enchant-$(ENCHANT_VERSION).tar.gz
 ENCHANT_SITE = http://www.abisource.com/downloads/enchant/$(ENCHANT_VERSION)
 ENCHANT_INSTALL_STAGING = YES
-- 
1.8.1.2
