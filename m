From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 15 May 2020 07:28:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpd: bump to version 0.21.23
Message-ID: <20200515052813.233605-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.21.23/NEWS

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index bce2d7e919..fd045e0f5e 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  565687d1899b585350cd66b603e46e5b79affc0a0e36d96d8953c6ccc6f69ba2  mpd-0.21.22.tar.xz
+sha256  439f522ca9800f375e4fb459ec31e61b3d824fc5c0580ff06dac48b5d21207a3  mpd-0.21.23.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index a7adfc0406..474927749a 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.21
-MPD_VERSION = $(MPD_VERSION_MAJOR).22
+MPD_VERSION = $(MPD_VERSION_MAJOR).23
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost
-- 
2.26.2
