From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 22 Feb 2015 20:21:50 +0100
Subject: [Buildroot] [PATCH next] imagemagick: bump to version 6.9.0-7
Message-ID: <1424632910-16342-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 09b6dcd..9d331f5 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From ftp://ftp.nluug.nl/pub/ImageMagick/digest.rdf
-sha256 a47f2731d453df502a93036ca1fea44c5852ed1b2c36af4343e6afb18652fefd ImageMagick-6.9.0-6.tar.xz
+sha256 90c90397ccf74200cd0e3931d3b26e6722665db235a66a5af392ac25d133d8c2 ImageMagick-6.9.0-7.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index a72778c..3a12a9c 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.0-6
+IMAGEMAGICK_VERSION = 6.9.0-7
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 # The official ImageMagick site only keeps the latest versions
 # available, which is annoying. Use an alternate site that keeps all
-- 
2.3.0
