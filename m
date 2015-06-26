From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Jun 2015 09:39:52 +0200
Subject: [Buildroot] [git commit] mpd: bump to version 0.19.10
Message-ID: <20150626075003.3F7A38074F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f50198a4417ce22eebf846004a35f0df17a1692
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/mpd.hash |    2 +-
 package/mpd/mpd.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 9f26f61..56d30f2 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	47851423053cd38cfad65be5985b41b7cd5bdbe8d0d13378e11748a28b19f26f	mpd-0.19.9.tar.xz
+sha256	c386eb3d22f98dc993b5ae3c272f969aa7763713483c6800040ebf1791b15851	mpd-0.19.10.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index b5adafd..7bbef03 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.19
-MPD_VERSION = $(MPD_VERSION_MAJOR).9
+MPD_VERSION = $(MPD_VERSION_MAJOR).10
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost libglib2
