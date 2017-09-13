From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 13 Sep 2017 22:52:36 +0200
Subject: [Buildroot] [PATCH 1/1] mpd: bump to version 0.20.10
Message-ID: <20170913205236.9630-1-joerg.krause@embedded.rocks>
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
index 2531abee01..873286cda9 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  cd77a2869e32354b004cc6b34fcb0bee56114caa2d9ed862aaa8071441e34eb7  mpd-0.20.9.tar.xz
+sha256  52fbc1125cdba41ba999add2820d45f3ce7cf493006bb04d8f0b2937204d3121  mpd-0.20.10.tar.xz
 sha256  8305b8bc026f4b6bde28b8dd09bfdddbe5590acf36358eed4d083a396e301730  mpd-0.19.21.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 6169e95762..692d402d35 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -6,7 +6,7 @@
 
 MPD_VERSION_MAJOR = $(call qstrip,$(BR2_PACKAGE_MPD_VERSION_STRING))
 ifeq ($(BR2_PACKAGE_MPD_VERSION_0_20),y)
-MPD_VERSION = $(MPD_VERSION_MAJOR).9
+MPD_VERSION = $(MPD_VERSION_MAJOR).10
 else
 MPD_VERSION = $(MPD_VERSION_MAJOR).21
 endif
-- 
2.14.1
