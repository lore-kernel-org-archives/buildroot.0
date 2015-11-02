From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Nov 2015 16:15:49 +0100
Subject: [Buildroot] [git commit] package/Config.in: move libvpx to
	Libraries/Multimedia
Message-ID: <20151102151553.9AF0E81DC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0338272f69862fcd3fd47d932130f66f354e8b27
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
