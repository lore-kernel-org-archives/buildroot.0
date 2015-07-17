From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 17 Jul 2015 09:54:43 +0200
Subject: [Buildroot] [PATCH 1/1] imagemagick: bump to version 6.9.1-8
Message-ID: <1437119683-25478-1-git-send-email-jerzy.grzegorek@trzebnica.net>
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
index 92cceb0..e57a994 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From ftp://ftp.nluug.nl/pub/ImageMagick/digest.rdf
-sha256 b610e5261c01664e19c91e513e21b3c2d76d583b497ee3c7cf2f20876d742328 ImageMagick-6.9.1-7.tar.xz
+sha256 987b353058482b5ba15d42746eebc51c15eb05241ce94f22381b8aae0b841617 ImageMagick-6.9.1-8.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 33f12e5..d4829a3 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.1-7
+IMAGEMAGICK_VERSION = 6.9.1-8
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
1.9.1
