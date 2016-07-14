From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Jul 2016 12:33:52 +0200
Subject: [Buildroot] [git commit] imagemagick: bump version to 7.0.2-4
Message-ID: <20160714103412.4C1D780129@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c18799b844224f4f78e2d81319e7bfbe5067bf8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Option --without-jp2 removed as it doesn't exist anymore.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index ef73b24..b04ecd5 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 a4420a125609d6cac2fbc141a291bbf143d71bd15e21c09946fdf98f90247225  ImageMagick-7.0.2-1.tar.xz
+sha256 3d870568432520095755fad9bb29b332351c7e25061d5d7d44873accc0eb08fe  ImageMagick-7.0.2-4.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 864e033..ae6c62a 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.2-1
+IMAGEMAGICK_VERSION = 7.0.2-4
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
@@ -30,7 +30,6 @@ IMAGEMAGICK_CONF_OPTS = \
 	--without-gslib \
 	--without-gvc \
 	--without-jbig \
-	--without-jp2 \
 	--without-lqr \
 	--without-openexr \
 	--without-perl \
