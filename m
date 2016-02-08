From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon,  8 Feb 2016 03:36:52 -0200
Subject: [Buildroot]  [PATCH 1/1] imagemagick: bump version to 6.9.3-3
Message-ID: <1454909812-32383-1-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
Previous version IS working, but it depends on
http://sources.buildroot.net/

Previous version was released less than a month ago.
But now its tarball got removed from the upstream download page
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 1d5794f..31ddfd2 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256	78a9bfc581c81fb8376c00d06431b49f218d3900690905dc985459cbf5e41c4d	ImageMagick-6.9.3-2.tar.xz
+sha256	d127f76c674f1454adf0444ecec96f344c3dca522cc3320f0ef88d8060123048	ImageMagick-6.9.3-3.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 76061fa..eee567e 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.3-2
+IMAGEMAGICK_VERSION = 6.9.3-3
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
1.9.1
