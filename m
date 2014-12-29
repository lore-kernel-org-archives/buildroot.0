From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon, 29 Dec 2014 23:35:48 +0100
Subject: [Buildroot] [PATCH 1/1] imagemagick: bump to version 6.9.0-2
Message-ID: <1419892549-21674-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/imagemagick/imagemagick.hash |    2 +-
 package/imagemagick/imagemagick.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 20bc982..463d88b 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From ftp://ftp.nluug.nl/pub/ImageMagick/digest.rdf
-sha256  12331c904c691cb128865fdc97e5f8a2654576f9b032e274b74dd7617aa1b9b6  ImageMagick-6.9.0-0.tar.xz
+sha256  8362d6b07ea08d2ccf0eb0c255f8369d1b1dea837daf1064e94ecc380b5ee51d  ImageMagick-6.9.0-2.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index db3b563..18d8729 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.0-0
+IMAGEMAGICK_VERSION = 6.9.0-2
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
-- 
1.7.9.5
