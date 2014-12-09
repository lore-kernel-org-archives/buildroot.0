From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 19:18:55 +0100
Subject: [Buildroot] [git commit] package/mpd: bump to version 0.19.6
Message-ID: <20141209182941.AD65980152@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ff68999edc80635845fb17d918e48ff65c5e40f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also update hash file.

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/mpd.hash |    2 +-
 package/mpd/mpd.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index f8dc05f..02590fa 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	e621e05e7d0e92690f7a1b6ee6f1e502a4d009c69caa4907519282ca571f72cf	mpd-0.19.5.tar.xz
+sha256	fac25376ee46b89249ee28a1ae13b2d5d1df7ff62464340c33c077015364d1e0	mpd-0.19.6.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index c80de41..3be2ae5 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.19
-MPD_VERSION = $(MPD_VERSION_MAJOR).5
+MPD_VERSION = $(MPD_VERSION_MAJOR).6
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost libglib2
