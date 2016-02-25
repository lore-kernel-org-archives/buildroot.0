From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Feb 2016 14:21:07 +0100
Subject: [Buildroot] [git commit] mpd: bump to version 0.19.13
Message-ID: <20160302202757.B4FA27F98B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53ac75b00eec46907401779a3a59988fd3be4cb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index bc4792a..85c99be 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	7b6fe6c7ce72f5f80a276d680072b524ecb395e546e252b8f3a0756377e1e875	mpd-0.19.12.tar.xz
+sha256	f1014838fa7ab2d5fe2ef7f4c101d58fdec2c4c13cfbd2462ee146c8e4919a55	mpd-0.19.13.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index d5d77a6..170a27f 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.19
-MPD_VERSION = $(MPD_VERSION_MAJOR).12
+MPD_VERSION = $(MPD_VERSION_MAJOR).13
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost libglib2
