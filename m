From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 18 Dec 2014 15:42:29 -0300
Subject: [Buildroot] [PATCH] mpd: bump to version 0.19.7
Message-ID: <1418928149-24581-1-git-send-email-gustavo@zacarias.com.ar>
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
index 02590fa..51d5fbb 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	fac25376ee46b89249ee28a1ae13b2d5d1df7ff62464340c33c077015364d1e0	mpd-0.19.6.tar.xz
+sha256	16d96332ec09d58ae2b914cfa509862e5f5b854dd52fdd6bda7336d66e888278	mpd-0.19.7.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 132ad44..2e664a3 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.19
-MPD_VERSION = $(MPD_VERSION_MAJOR).6
+MPD_VERSION = $(MPD_VERSION_MAJOR).7
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost libglib2
-- 
2.0.4
