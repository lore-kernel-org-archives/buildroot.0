From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 14:14:33 +0200
Subject: [Buildroot] [git commit] mpv: fix typo in xkbcommon comment
Message-ID: <20160428121514.842EA806CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=506662f74a9980640f046294fcb5b17a8710ca7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpv/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 36617e5..b354d4d 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_MPV
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_ZLIB
-	# Select xkbcommon for wayland to avoid being misterious
+	# Select xkbcommon for wayland to avoid being mysterious
 	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
 	help
 	  mpv is a fork of mplayer2 and MPlayer. It shares some features
