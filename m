From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 May 2017 18:19:44 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/imagemagick: bump version to
	7.0.5-8
Message-ID: <20170528161944.9871-1-bernd.kuhls@t-online.de>
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
index 8f7461820..ce7e6b875 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 f72d089074d6c968bab38d1c18b22bd92c876e7ae23f7261db0b7c3552186586  ImageMagick-7.0.5-7.tar.xz
+sha256 007648793640b1d33f1285426df7c43fcf412eaef27b0b68fa7977bf29c4d30e  ImageMagick-7.0.5-8.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 46ee40432..ae6122c96 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.5-7
+IMAGEMAGICK_VERSION = 7.0.5-8
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
2.11.0
