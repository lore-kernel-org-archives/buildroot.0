From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Thu, 31 Jul 2014 00:18:17 +0200
Subject: [Buildroot] [PATCH 1/1] mpd: Remove unsupported libcue
Message-ID: <1406758697-1368-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for libcue has been removed for mpd since version 0.17.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/mpd/Config.in | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index e09be0b..f5f5b34 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -96,12 +96,6 @@ config BR2_PACKAGE_MPD_LAME
 	help
 	  Enable lame (mp3) encoding support.
 
-config BR2_PACKAGE_MPD_LIBCUE
-	bool "libcue"
-	select BR2_PACKAGE_LIBCUE
-	help
-	  Enable cue file support.
-
 config BR2_PACKAGE_MPD_LIBSAMPLERATE
 	bool "libsamplerate"
 	select BR2_PACKAGE_LIBSAMPLERATE
-- 
2.0.3
