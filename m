From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Jan 2015 21:50:37 -0300
Subject: [Buildroot] [PATCH] mpd: bump to version 0.19.8
Message-ID: <1421283037-7018-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 51d5fbb..5cb6102 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	16d96332ec09d58ae2b914cfa509862e5f5b854dd52fdd6bda7336d66e888278	mpd-0.19.7.tar.xz
+sha256	d3c069d2867e362b343c5babea3e7fe9e6780d3dcb1be38808a8ea48911bae50	mpd-0.19.8.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 2e664a3..7333164 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.19
-MPD_VERSION = $(MPD_VERSION_MAJOR).7
+MPD_VERSION = $(MPD_VERSION_MAJOR).8
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost libglib2
-- 
2.0.5
