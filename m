From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Mon, 11 Aug 2014 13:42:51 +0200
Subject: [Buildroot] [PATCH 1/4] mpd: Fix config option for plugin FAAD2
In-Reply-To: <1407757374-7456-1-git-send-email-jkrause@posteo.de>
References: <1407757374-7456-1-git-send-email-jkrause@posteo.de>
Message-ID: <1407757374-7456-2-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/mpd/mpd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index e2ee760..cd18754 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -48,7 +48,7 @@ endif
 ifeq ($(BR2_PACKAGE_MPD_FAAD2),y)
 MPD_DEPENDENCIES += faad2
 else
-MPD_CONF_OPT += --disable-faad2
+MPD_CONF_OPT += --disable-aac
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_FLAC),y)
-- 
2.0.4
