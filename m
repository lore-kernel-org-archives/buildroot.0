From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  2 Apr 2014 21:46:47 +0200
Subject: [Buildroot] [PATCH v2 33/41] xbmc: Add missing host-infozip
	dependency (v2)
In-Reply-To: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396468015-1724-33-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

v2: rebased v1
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/xbmc.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index a16ba2f..f29e04d 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -12,7 +12,7 @@ XBMC_LICENSE_FILES = LICENSE.GPL
 # called TexturePacker. It is responsible to take all the images used in the
 # GUI and pack them in a blob.
 # http://wiki.xbmc.org/index.php?title=TexturePacker
-XBMC_DEPENDENCIES = host-gawk host-gperf host-lzo host-sdl_image host-swig
+XBMC_DEPENDENCIES = host-gawk host-gperf host-infozip host-lzo host-sdl_image host-swig
 XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
 	libass libcdio libcurl libegl libfribidi libgcrypt libgles libmad libmodplug libmpeg2 \
 	libogg libplist libpng libsamplerate libungif libvorbis libxml2 lzo ncurses \
-- 
1.7.10.4
