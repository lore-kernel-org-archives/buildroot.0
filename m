From: Axel Lin <axel.lin@ingics.com>
Date: Fri, 13 Dec 2013 11:15:55 +0800
Subject: [Buildroot] [PATCH] zxing: bump to version 2.3.0
Message-ID: <1386904555.3768.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/zxing/zxing.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zxing/zxing.mk b/package/zxing/zxing.mk
index e12b953..f58be08 100644
--- a/package/zxing/zxing.mk
+++ b/package/zxing/zxing.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZXING_VERSION = 2.0
+ZXING_VERSION = 2.3.0
 ZXING_SITE = http://zxing.googlecode.com/files
 ZXING_SOURCE = ZXing-$(ZXING_VERSION).zip
 ZXING_LICENSE = Apache v2.0
-- 
1.8.1.2
