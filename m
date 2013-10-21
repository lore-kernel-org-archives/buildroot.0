From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon, 21 Oct 2013 08:25:55 +0200
Subject: [Buildroot] [PATCH 1/1] imagemagick: bump to version 6.8.7-1
Message-ID: <1382336755-846-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/imagemagick/imagemagick.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index f5aacb6..4b58148 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 IMAGEMAGICK_MAJOR = 6.8.7
-IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-0
-IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.bz2
+IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-1
+IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
 # older versions.
-- 
1.7.9.5
