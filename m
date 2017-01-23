From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 23 Jan 2017 12:48:37 +0000
Subject: [Buildroot] [PATCH] imagemagick: bump version to 7.0.4-5
Message-ID: <20170123124837.55830-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index d0ed022..3f5bfb1 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 c46975d23ff0c587219daaa3e1dbd43a54a5d7d5ec20d0bdc2c34188facdb0f9  ImageMagick-7.0.4-4.tar.xz
+sha256 69178335a906202928571e25b1670a4bb066500b9693c7ba554583e8d700fcf5  ImageMagick-7.0.4-5.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 9d2c964..64c6a35 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.4-4
+IMAGEMAGICK_VERSION = 7.0.4-5
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
2.10.2
