From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sun,  1 Dec 2013 23:23:52 +0100
Subject: [Buildroot] [PATCH 1/1] imagemagick: bump to version 6.8.7-8
Message-ID: <1385936632-12587-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/imagemagick/imagemagick.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index c8f3a56..0a72fd7 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IMAGEMAGICK_MAJOR = 6.8.7
-IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-5
+IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-8
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
-- 
1.7.9.5
