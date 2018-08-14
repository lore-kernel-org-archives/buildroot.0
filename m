From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 15:55:52 +0200
Subject: [Buildroot] [git commit branch/next] kodi: drop trailing backslash
Message-ID: <20180814134917.47E858D2B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f618b202b034354ba5f57dfa41f0c0a3ea2a420
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes the following check-package failure:

package/kodi/kodi.mk:53: remove trailing backslash

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi/kodi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 4242f2fccc..8e8d53d6b0 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -50,7 +50,7 @@ KODI_SUBDIR = project/cmake
 # taken from tools/depends/target/ffmpeg/FFMPEG-VERSION
 KODI_FFMPEG_VERSION = 3.1.11-Krypton-17.5
 KODI_EXTRA_DOWNLOADS += \
-	https://github.com/xbmc/FFmpeg/archive/$(KODI_FFMPEG_VERSION).tar.gz \
+	https://github.com/xbmc/FFmpeg/archive/$(KODI_FFMPEG_VERSION).tar.gz
 
 KODI_LIBDVDCSS_VERSION = 2f12236
 KODI_LIBDVDNAV_VERSION = 981488f
