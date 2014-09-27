From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 27 Sep 2014 21:41:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpd: bump to version 0.18.16
Message-ID: <1411846916-9850-1-git-send-email-jkrause@posteo.de>
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
index cf766c1..15ebc38 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.18
-MPD_VERSION = $(MPD_VERSION_MAJOR).14
+MPD_VERSION = $(MPD_VERSION_MAJOR).16
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf libglib2
-- 
2.1.1
