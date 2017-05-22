From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 22 May 2017 21:23:56 +0200
Subject: [Buildroot] [PATCH/next] package/imagemagick: bump version to
	7.0.5-7
Message-ID: <20170522192356.14434-1-bernd.kuhls@t-online.de>
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
index b7be7bc66..8f7461820 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 f60c3e3466ccbf9a0e643284ffec3467363edf9611f16a98387f927a974b49ab  ImageMagick-7.0.5-6.tar.xz
+sha256 f72d089074d6c968bab38d1c18b22bd92c876e7ae23f7261db0b7c3552186586  ImageMagick-7.0.5-7.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index b1048f5f6..46ee40432 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.5-6
+IMAGEMAGICK_VERSION = 7.0.5-7
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
2.11.0
