From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 11 Oct 2013 18:30:33 +0200
Subject: [Buildroot] [PATCH 1/1] jpeg-turbo: bump to version 1.3.0
Message-ID: <1381509033-5277-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/jpeg-turbo/jpeg-turbo.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index c19959c..e6a0b24 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 1.2.1
+JPEG_TURBO_VERSION = 1.3.0
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = http://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_INSTALL_STAGING = YES
-- 
1.7.9.5
