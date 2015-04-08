From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  8 Apr 2015 22:21:47 +0200
Subject: [Buildroot] [PATCH 2/2] package/kodi: Remove unused dependency to
	libungif
In-Reply-To: <1428524507-30375-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428524507-30375-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1428524507-30375-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in |    1 -
 package/kodi/kodi.mk   |    2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 88d1109..91c1cce 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -58,7 +58,6 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_LIBPLIST
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LIBSAMPLERATE
-	select BR2_PACKAGE_LIBUNGIF
 	select BR2_PACKAGE_LIBVORBIS
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBXSLT
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index ad73dcb..8712b12 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -18,7 +18,7 @@ KODI_DEPENDENCIES = host-gawk host-gettext host-gperf host-infozip host-lzo \
 	host-nasm host-sdl_image host-swig
 KODI_DEPENDENCIES += boost bzip2 expat ffmpeg fontconfig freetype jasper jpeg \
 	libass libcdio libcurl libfribidi libgcrypt libmad libmodplug libmpeg2 \
-	libogg libplist libpng libsamplerate libungif libvorbis libxml2 libxslt lzo ncurses \
+	libogg libplist libpng libsamplerate libvorbis libxml2 libxslt lzo ncurses \
 	openssl pcre python readline sqlite taglib tiff tinyxml yajl zlib
 
 KODI_CONF_ENV = \
-- 
1.7.10.4
