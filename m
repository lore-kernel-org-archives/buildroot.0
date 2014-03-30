From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Mar 2014 01:15:12 +0100
Subject: [Buildroot] [PATCH] package/xbmc: add missing dependency to libgles
	and libegl
Message-ID: <1396138512-7311-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/xbmc/xbmc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 6dbbb7d..9e346bd 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -14,7 +14,7 @@ XBMC_LICENSE_FILES = LICENSE.GPL
 # http://wiki.xbmc.org/index.php?title=TexturePacker
 XBMC_DEPENDENCIES = host-gperf host-lzo host-sdl_image host-swig
 XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
-	libass libcdio libcurl libfribidi libgcrypt libmad libmodplug libmpeg2 \
+	libass libcdio libcurl libegl libfribidi libgcrypt libgles libmad libmodplug libmpeg2 \
 	libogg libplist libpng libsamplerate libungif libvorbis libxml2 lzo ncurses \
 	openssl pcre python readline sqlite taglib tiff tinyxml yajl zlib
 
-- 
1.8.3.2
