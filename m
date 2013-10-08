From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue,  8 Oct 2013 08:03:17 +0200
Subject: [Buildroot] [PATCH 2/2] imagemagick: bump to version 6.8.7 0
In-Reply-To: <1381212197-5119-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1381212197-5119-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1381212197-5119-2-git-send-email-jerzy.grzegorek@trzebnica.net>
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
index 2149574..f5aacb6 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IMAGEMAGICK_MAJOR = 6.8.6
-IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-2
+IMAGEMAGICK_MAJOR = 6.8.7
+IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-0
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.bz2
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
-- 
1.7.9.5
