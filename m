From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 23:17:02 +0200
Subject: [Buildroot] [git commit] package/mpd: bump version to 0.21.22
Message-ID: <20200412210304.6BF578E925@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a738b5476f1ed7fe7a205542cdd5ce19937d17e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.21.22/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 70ca9df582..bce2d7e919 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  422ef0a996d961f3ebc6856395f3a855b45fa0059910e878fb98281007e510e1  mpd-0.21.20.tar.xz
+sha256  565687d1899b585350cd66b603e46e5b79affc0a0e36d96d8953c6ccc6f69ba2  mpd-0.21.22.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index a879a33d33..a7adfc0406 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.21
-MPD_VERSION = $(MPD_VERSION_MAJOR).20
+MPD_VERSION = $(MPD_VERSION_MAJOR).22
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost
