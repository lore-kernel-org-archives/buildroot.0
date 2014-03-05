From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed,  5 Mar 2014 08:56:53 +0100
Subject: [Buildroot] [PATCH 1/1] imagemagick: bump to version 6.8.8-7
Message-ID: <1394006213-32325-1-git-send-email-jerzy.grzegorek@trzebnica.net>
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
index 4f2a65f..c81ed24 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.8.8-4
+IMAGEMAGICK_VERSION = 6.8.8-7
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
-- 
1.7.9.5
