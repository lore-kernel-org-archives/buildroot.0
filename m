From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Oct 2015 17:43:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/imagemagick: bump version to 6.9.2-4
Message-ID: <1444578207-4705-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 8b1cd75..716eaa7 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From ftp://ftp.nluug.nl/pub/ImageMagick/digest.rdf
-sha256	e251574136e4a82128b3860b97c72b289df0a2030ce72900c91b67685a3298e4	ImageMagick-6.9.2-3.tar.xz
+sha256	05b1c499415048099a1464ebd03f0cfaae8d0994c681bcf7e0319b26e5e8d848	ImageMagick-6.9.2-4.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 0e14c7d..3b96126 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.2-3
+IMAGEMAGICK_VERSION = 6.9.2-4
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
2.6.1
