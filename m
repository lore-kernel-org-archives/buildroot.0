From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Dec 2014 22:56:08 +0100
Subject: [Buildroot] [git commit] mpd: bump to version 0.19.7
Message-ID: <20141218220056.67E7F7FED9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc90a3d09c11c89e3e1495cf2de58b9f23a2a0a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/mpd.hash |    2 +-
 package/mpd/mpd.mk   |    2 +-
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
