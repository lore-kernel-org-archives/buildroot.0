From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Oct 2010 11:48:58 +0200
Subject: [Buildroot] [git commit master 1/1] imagemagick: fix
	s/IMAGEMAGISK/IMAGEMAGICK/ typo
Message-ID: <20101006103553.DDCB88B7C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=259a129e81184b9d5f0fd998a940c7b4943fde81
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/imagemagick/imagemagick.mk |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index f14adb9..30158e0 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -33,49 +33,49 @@ ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 IMAGEMAGICK_CONF_OPT += --with-fontconfig
 IMAGEMAGICK_DEPENDENCIES += fontconfig
 else
-IMAGEMAGISK_CONF_OPT += --without-fontconfig
+IMAGEMAGICK_CONF_OPT += --without-fontconfig
 endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 IMAGEMAGICK_CONF_OPT += --with-freetype
 IMAGEMAGICK_DEPENDENCIES += freetype
 else
-IMAGEMAGISK_CONF_OPT += --without-freetype
+IMAGEMAGICK_CONF_OPT += --without-freetype
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
 IMAGEMAGICK_CONF_OPT += --with-jpeg
 IMAGEMAGICK_DEPENDENCIES += jpeg
 else
-IMAGEMAGISK_CONF_OPT += --without-jpeg
+IMAGEMAGICK_CONF_OPT += --without-jpeg
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 IMAGEMAGICK_CONF_OPT += --with-png
 IMAGEMAGICK_DEPENDENCIES += libpng
 else
-IMAGEMAGISK_CONF_OPT += --without-png
+IMAGEMAGICK_CONF_OPT += --without-png
 endif
 
 ifeq ($(BR2_PACKAGE_LIBRSVG),y)
 IMAGEMAGICK_CONF_OPT += --with-rsvg
 IMAGEMAGICK_DEPENDENCIES += librsvg
 else
-IMAGEMAGISK_CONF_OPT += --without-rsvg
+IMAGEMAGICK_CONF_OPT += --without-rsvg
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 IMAGEMAGICK_CONF_OPT += --with-xml
 IMAGEMAGICK_DEPENDENCIES += libxml2
 else
-IMAGEMAGISK_CONF_OPT += --without-xml
+IMAGEMAGICK_CONF_OPT += --without-xml
 endif
 
 ifeq ($(BR2_PACKAGE_TIFF),y)
 IMAGEMAGICK_CONF_OPT += --with-tiff
 IMAGEMAGICK_DEPENDENCIES += tiff
 else
-IMAGEMAGISK_CONF_OPT += --without-tiff
+IMAGEMAGICK_CONF_OPT += --without-tiff
 endif
 
 $(eval $(call AUTOTARGETS,package,imagemagick))
-- 
1.7.1
