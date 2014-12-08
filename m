From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Mon,  8 Dec 2014 23:44:50 +0100
Subject: [Buildroot] [PATCH 2/6] package/mpd: fix typo
In-Reply-To: <1418078694-26331-1-git-send-email-jkrause@posteo.de>
References: <1418078694-26331-1-git-send-email-jkrause@posteo.de>
Message-ID: <1418078694-26331-2-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix little type: it's UPnP, not UPnp.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/mpd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 1d38b1a..4097f52 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -279,7 +279,7 @@ config BR2_PACKAGE_MPD_TCP
 	  on different machines (the usual scenario).
 
 config BR2_PACKAGE_MPD_UPNP
-	bool "UPnp"
+	bool "UPnP"
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBUPNP
 	help
-- 
2.1.3
