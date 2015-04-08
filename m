From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 22:31:52 +0200
Subject: [Buildroot] [git commit] package/kodi: Remove unused dependency to
	libungif
Message-ID: <20150408203155.DF32B819AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=837e12b61e7f5cf137ebf8ae365d5be5823d921b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in |    1 -
 package/kodi/kodi.mk   |    2 +-
 2 files changed, 1 insertions(+), 2 deletions(-)

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
