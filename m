From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  6 Sep 2016 00:46:53 -0300
Subject: [Buildroot] [PATCH] mpd: bump to version 0.19.19
Message-ID: <1473133613-9299-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It fixes runtime issues with ffmpeg 3.1.x

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.7.3
