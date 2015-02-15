From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 15 Feb 2015 12:16:28 -0300
Subject: [Buildroot] [PATCH] mpd: bump to version 0.19.9
Message-ID: <1424013388-3489-1-git-send-email-gustavo@zacarias.com.ar>
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
index 5cb6102..9f26f61 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	d3c069d2867e362b343c5babea3e7fe9e6780d3dcb1be38808a8ea48911bae50	mpd-0.19.8.tar.xz
+sha256	47851423053cd38cfad65be5985b41b7cd5bdbe8d0d13378e11748a28b19f26f	mpd-0.19.9.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 7333164..41f3564 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.19
-MPD_VERSION = $(MPD_VERSION_MAJOR).8
+MPD_VERSION = $(MPD_VERSION_MAJOR).9
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost libglib2
-- 
2.0.5
