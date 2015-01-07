From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  7 Jan 2015 16:42:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi: Needs
	BR2_PACKAGE_FFMPEG_SWSCALE
Message-ID: <1420645368-2408-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/8ab/8ab84a0e690b4e778aee5ac8ee7835da5737cfb4/
http://autobuild.buildroot.net/results/2b6/2b6a6ffb4ac464bcd41ad51c17d8a34f1967819f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 41f7798..7d89b5b 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -38,6 +38,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_GPL
 	select BR2_PACKAGE_FFMPEG_POSTPROC # postproc depends on GPL
+	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_JASPER
-- 
1.7.10.4
