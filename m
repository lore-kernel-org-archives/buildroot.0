From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 24 Jun 2016 11:35:23 +0100
Subject: [Buildroot] [PATCH] imagemagick: bump version to 7.0.2-1
Message-ID: <1466764523-40003-1-git-send-email-Vincent.Riera@imgtec.com>
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
index e34f15a..ef73b24 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256	cd3076a573a815ff828c75d231eef8660f2f6c5eaf848c2f4e8c4dcc955671ea	ImageMagick-7.0.2-0.tar.xz
+sha256 a4420a125609d6cac2fbc141a291bbf143d71bd15e21c09946fdf98f90247225  ImageMagick-7.0.2-1.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 5ec9174..94c9647 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.2-0
+IMAGEMAGICK_VERSION = 7.0.2-1
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
2.7.3
