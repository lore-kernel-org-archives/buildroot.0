From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed,  2 Apr 2014 00:24:39 +0200
Subject: [Buildroot] [PATCH 2/2] xbmc: Add missing host-infozip dependency
In-Reply-To: <1396391079-28455-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1396391079-28455-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1396391079-28455-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

XBMC needs the zip command for the host to build.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/xbmc/xbmc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 9e346bd..59255a4 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -12,7 +12,7 @@ XBMC_LICENSE_FILES = LICENSE.GPL
 # called TexturePacker. It is responsible to take all the images used in the
 # GUI and pack them in a blob.
 # http://wiki.xbmc.org/index.php?title=TexturePacker
-XBMC_DEPENDENCIES = host-gperf host-lzo host-sdl_image host-swig
+XBMC_DEPENDENCIES = host-gperf host-infozip host-lzo host-sdl_image host-swig
 XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
 	libass libcdio libcurl libegl libfribidi libgcrypt libgles libmad libmodplug libmpeg2 \
 	libogg libplist libpng libsamplerate libungif libvorbis libxml2 lzo ncurses \
-- 
1.9.1
