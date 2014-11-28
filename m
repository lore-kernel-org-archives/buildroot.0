From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Nov 2014 10:59:02 -0300
Subject: [Buildroot] [PATCH] mpd: bump to version 0.19.5
Message-ID: <1417183142-10943-1-git-send-email-gustavo@zacarias.com.ar>
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
index f8bf014..f8dc05f 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	18f4af89e8b9a434da2b8678b53fc8189da97c1f32e9083512d67217166d3bd8	mpd-0.19.4.tar.xz
+sha256	e621e05e7d0e92690f7a1b6ee6f1e502a4d009c69caa4907519282ca571f72cf	mpd-0.19.5.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 1369847..5448251 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.19
-MPD_VERSION = $(MPD_VERSION_MAJOR).4
+MPD_VERSION = $(MPD_VERSION_MAJOR).5
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost libglib2
-- 
2.0.4
