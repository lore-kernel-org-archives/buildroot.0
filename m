From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 12 Feb 2015 13:48:37 +0100
Subject: [Buildroot] [PATCH 1/1] imagemagick: bump to version 6.9.0-5
Message-ID: <1423745317-28314-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index f425c3d..92d2239 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From ftp://ftp.nluug.nl/pub/ImageMagick/digest.rdf
-sha256	996aa8081dced3f3bbf23d90fca861b30332f734329f89367c6fc35173a74957  ImageMagick-6.9.0-4.tar.xz
+sha256 56e3ba52ef0a0c0bc25b34a435312d0ee2aa22f43ba74801ab3888b37b21871e  ImageMagick-6.9.0-5.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index f78fcd3..7ddde6e 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.0-4
+IMAGEMAGICK_VERSION = 6.9.0-5
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
-- 
1.9.1
