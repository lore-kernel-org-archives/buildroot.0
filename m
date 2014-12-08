From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Mon,  8 Dec 2014 23:44:51 +0100
Subject: [Buildroot] [PATCH 3/6] package/mpd: make all package names in help
	text uppercase
In-Reply-To: <1418078694-26331-1-git-send-email-jkrause@posteo.de>
References: <1418078694-26331-1-git-send-email-jkrause@posteo.de>
Message-ID: <1418078694-26331-3-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make the package name uppercase to be consistent in all the help texts.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/mpd/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 4097f52..3435b05 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -273,9 +273,9 @@ config BR2_PACKAGE_MPD_TCP
 	bool "tcp sockets"
 	default y
 	help
-	  Enable mpd to listen on tcp sockets.
+	  Enable MPD to listen on tcp sockets.
 
-	  You want this on if mpd and the client(s) work
+	  You want this on if MPD and the client(s) work
 	  on different machines (the usual scenario).
 
 config BR2_PACKAGE_MPD_UPNP
@@ -283,7 +283,7 @@ config BR2_PACKAGE_MPD_UPNP
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBUPNP
 	help
-	  Enable mpd UPnP client support.
+	  Enable MPD UPnP client support.
 
 endif
 
-- 
2.1.3
