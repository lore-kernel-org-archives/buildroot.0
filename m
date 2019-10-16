From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 17 Oct 2019 00:19:10 +0200
Subject: [Buildroot] [PATCH] package/mpd: bump to version 0.21.16
Message-ID: <20191016221910.199358-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 20c398ed55..798dd73369 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  1e2c8a8d89e8792b1849075cf51aa0695e1957cd5c4281209acff1dd53b57646  mpd-0.21.14.tar.xz
+sha256  30cf1bddf7d7388487276745ad3515f134e07f0c57f9f97cb2b5d3befd4a4d92  mpd-0.21.16.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 708addeb04..6e980b8df1 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.21
-MPD_VERSION = $(MPD_VERSION_MAJOR).14
+MPD_VERSION = $(MPD_VERSION_MAJOR).16
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost
-- 
2.23.0
