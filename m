From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon, 13 Apr 2015 23:38:19 +0200
Subject: [Buildroot] [PATCH 1/1] imagemagick: bump to version 6.9.1-1
Message-ID: <1428961099-30334-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also update hash file.

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index d93ccfe..b1c9caf 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From ftp://ftp.nluug.nl/pub/ImageMagick/digest.rdf
-sha256 32747565fc30da0ff0bc0bf3e41c9fefad829fa8fb2f7d1b98dd84ddb3919b0e ImageMagick-6.9.1-0.tar.xz
+sha256 8f6ebeb1a1321fd7b7d3161a66461743ea5bbc352e4339c792b3bab52c379378 ImageMagick-6.9.1-1.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index b6ef09c..1594f69 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.1-0
+IMAGEMAGICK_VERSION = 6.9.1-1
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
1.9.1
