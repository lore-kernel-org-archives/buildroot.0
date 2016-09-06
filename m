From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Sep 2016 21:30:55 +0200
Subject: [Buildroot] [git commit] mpd: bump to version 0.19.19
Message-ID: <20160906193115.C33B67F9FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73bc370c642fdf02532d59a556406f8d33daa22a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It fixes runtime issues with ffmpeg 3.1.x

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 4b564bf..8f620e7 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  764c991c54980cb97e876e3f65d63410c0c561b7be996b832e058053e005ed47  mpd-0.19.18.tar.xz
+sha256  bc856cda4136403446d53d11576f86990b61d1fe4668f6008e9eae47450d4e1d  mpd-0.19.19.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index de168c1..0bf8ece 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.19
-MPD_VERSION = $(MPD_VERSION_MAJOR).18
+MPD_VERSION = $(MPD_VERSION_MAJOR).19
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost libglib2
