From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 12 Jan 2021 22:49:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/mpd: bump to version 0.22.3
Message-ID: <20210112214941.1483222-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 0381430778..866c61d15f 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  20a0ad01bf327b2dbeb6ae8e1af952cb0de83d2d63fab0fa4b7183a74765c201  mpd-0.21.25.tar.xz
+sha256  338012037b5e67730529187c555a54cc567a85b15a7e8ddb3a807b1971566ccf  mpd-0.22.3.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index a5825fffe0..6e8a3f36da 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MPD_VERSION_MAJOR = 0.21
-MPD_VERSION = $(MPD_VERSION_MAJOR).25
+MPD_VERSION_MAJOR = 0.22
+MPD_VERSION = $(MPD_VERSION_MAJOR).3
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost
-- 
2.30.0
