From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Mon,  8 Dec 2014 23:44:52 +0100
Subject: [Buildroot] [PATCH 4/6] package/mpd: fix line length for help text
In-Reply-To: <1418078694-26331-1-git-send-email-jkrause@posteo.de>
References: <1418078694-26331-1-git-send-email-jkrause@posteo.de>
Message-ID: <1418078694-26331-4-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make help text lines not longer as 80 characters (one tab weights eight chars).

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/mpd/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 3435b05..901902b 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -65,8 +65,8 @@ config BR2_PACKAGE_MPD_AUDIOFILE
 config BR2_PACKAGE_MPD_DSD
 	bool "dsd"
 	help
-	  Enable Digital Speech Decoder (DSD) support to play audio files encoded
-	  in a digital speech format.
+	  Enable Digital Speech Decoder (DSD) support to play audio files
+	  encoded in a digital speech format.
 
 config BR2_PACKAGE_MPD_FAAD2
 	bool "faad2"
@@ -263,8 +263,8 @@ config BR2_PACKAGE_MPD_AVAHI_SUPPORT
 	select BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY
 	help
 	  Enable Avahi (zeroconf) support.
-	  Select this for multicast DNS/DNS-SD service discovery support. This allows
-	  MPD to publish service information on a local network.
+	  Select this for multicast DNS/DNS-SD service discovery support. This
+	  allows MPD to publish service information on a local network.
 
 comment "avahi support needs a toolchain w/ dynamic library"
 	depends on BR2_PREFER_STATIC_LIB
-- 
2.1.3
