From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  1 Nov 2015 18:30:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/Config.in: move libvpx to
	Libraries/Multimedia
Message-ID: <1446399004-5864-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 10ff94e..348e711 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -20,7 +20,6 @@ menu "Audio and video applications"
 	source "package/jack2/Config.in"
 	source "package/kodi/Config.in"
 	source "package/lame/Config.in"
-	source "package/libvpx/Config.in"
 	source "package/madplay/Config.in"
 	source "package/mjpegtools/Config.in"
 	source "package/modplugtools/Config.in"
@@ -974,6 +973,7 @@ menu "Multimedia"
 	source "package/libopenh264/Config.in"
 	source "package/libplayer/Config.in"
 	source "package/libtheora/Config.in"
+	source "package/libvpx/Config.in"
 	source "package/libyuv/Config.in"
 	source "package/live555/Config.in"
 	source "package/mediastreamer/Config.in"
-- 
2.6.1
