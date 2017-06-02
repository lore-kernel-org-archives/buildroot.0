From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  2 Jun 2017 06:45:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/imagemagick: bump version to 7.0.5-9
Message-ID: <20170602044535.29603-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/8d9/8d94627ccce15ae1f348a7a9f54621b2b5a74321/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index ce7e6b875..c6f427ea6 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 007648793640b1d33f1285426df7c43fcf412eaef27b0b68fa7977bf29c4d30e  ImageMagick-7.0.5-8.tar.xz
+sha256 b774c3a69fea4432a120a8c0c231bd011710166c71a7b7e0fbb89b108d29ac6c  ImageMagick-7.0.5-9.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index ae6122c96..37faf5484 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.5-8
+IMAGEMAGICK_VERSION = 7.0.5-9
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
2.11.0
