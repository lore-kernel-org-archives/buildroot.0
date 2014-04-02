From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  2 Apr 2014 21:46:48 +0200
Subject: [Buildroot] [PATCH v2 34/41] WIP: xbmc: Bump version to Gotham_beta3
In-Reply-To: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396468015-1724-34-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/Config.in |    1 +
 package/xbmc/xbmc.mk   |    4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index cf6a6b9..fc8811e 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -35,6 +35,7 @@ menuconfig BR2_PACKAGE_XBMC
 	select BR2_PACKAGE_LIBUNGIF
 	select BR2_PACKAGE_LIBVORBIS
 	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index f29e04d..e5eadd9 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XBMC_VERSION = 12.3-Frodo
+XBMC_VERSION = Gotham_beta3
 XBMC_SITE = $(call github,xbmc,xbmc,$(XBMC_VERSION))
 XBMC_LICENSE = GPLv2
 XBMC_LICENSE_FILES = LICENSE.GPL
@@ -15,7 +15,7 @@ XBMC_LICENSE_FILES = LICENSE.GPL
 XBMC_DEPENDENCIES = host-gawk host-gperf host-infozip host-lzo host-sdl_image host-swig
 XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
 	libass libcdio libcurl libegl libfribidi libgcrypt libgles libmad libmodplug libmpeg2 \
-	libogg libplist libpng libsamplerate libungif libvorbis libxml2 lzo ncurses \
+	libogg libplist libpng libsamplerate libungif libvorbis libxml2 libxslt lzo ncurses \
 	openssl pcre python readline sqlite taglib tiff tinyxml yajl zlib
 
 XBMC_CONF_ENV = \
-- 
1.7.10.4
