From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu,  2 Apr 2015 08:12:29 +0200
Subject: [Buildroot] [PATCH 1/1] imagemagick: bump to version 6.9.1-0
Message-ID: <1427955149-2676-1-git-send-email-jerzy.grzegorek@trzebnica.net>
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
index 16d5927..d93ccfe 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From ftp://ftp.nluug.nl/pub/ImageMagick/digest.rdf
-sha256 d1f5dcd32a93130feb9e980a8a97517d3a2c814a8b608d139d4756516548748c ImageMagick-6.9.0-10.tar.xz
+sha256 32747565fc30da0ff0bc0bf3e41c9fefad829fa8fb2f7d1b98dd84ddb3919b0e ImageMagick-6.9.1-0.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index f11ebf5..46bf8b4 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.0-10
+IMAGEMAGICK_VERSION = 6.9.1-0
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
1.9.1
