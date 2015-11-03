From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 15:49:13 +0100
Subject: [Buildroot] [git commit] mpd: security bump to version 0.19.11
Message-ID: <20151103145130.0911F80E24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3546986f55ea01866eb24e513e5c09d5d5fba897
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes an ape tag parsing buffer overflow.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/mpd.hash |    2 +-
 package/mpd/mpd.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 56d30f2..1b6c80b 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	c386eb3d22f98dc993b5ae3c272f969aa7763713483c6800040ebf1791b15851	mpd-0.19.10.tar.xz
+sha256	7a5c66aa5af97a5b7af3dc49e3d2594071dafd62a14e2e9f7c9a5a86342836c6	mpd-0.19.11.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 7bbef03..7e6b60f 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.19
-MPD_VERSION = $(MPD_VERSION_MAJOR).10
+MPD_VERSION = $(MPD_VERSION_MAJOR).11
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost libglib2
