From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 24 Mar 2016 08:39:43 +0100
Subject: [Buildroot] [PATCH 1/1] imagemagick: bump to version 6.9.3-7
Message-ID: <1458805183-4425-1-git-send-email-jerzy.grzegorek@trzebnica.net>
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
index 31ddfd2..ca80848 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256	d127f76c674f1454adf0444ecec96f344c3dca522cc3320f0ef88d8060123048	ImageMagick-6.9.3-3.tar.xz
+sha256 6731c414b5b939713a73a088840ed68c22c91d1335514d228d6687d07ce2e1c8 ImageMagick-6.9.3-7.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 639b0e8..4d37873 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.3-3
+IMAGEMAGICK_VERSION = 6.9.3-7
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
1.9.1
