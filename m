From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 17 Feb 2015 09:12:58 +0100
Subject: [Buildroot] [PATCH] imagemagick: bump to version 6.9.0-6
Message-ID: <1424160778-25875-1-git-send-email-Fabio.Porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <Fabio.Porcedda@gmail.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 92d2239..09b6dcd 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From ftp://ftp.nluug.nl/pub/ImageMagick/digest.rdf
-sha256 56e3ba52ef0a0c0bc25b34a435312d0ee2aa22f43ba74801ab3888b37b21871e  ImageMagick-6.9.0-5.tar.xz
+sha256 a47f2731d453df502a93036ca1fea44c5852ed1b2c36af4343e6afb18652fefd ImageMagick-6.9.0-6.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 7ddde6e..a72778c 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.0-5
+IMAGEMAGICK_VERSION = 6.9.0-6
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
-- 
2.3.0
