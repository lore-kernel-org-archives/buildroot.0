From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue,  9 Jan 2018 09:39:49 +0100
Subject: [Buildroot] [PATCH] mpd: bump to version 0.20.15
Message-ID: <20180109083949.9732-1-joerg.krause@embedded.rocks>
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
index 99ec6c82f2..735ea700ff 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  7d59afa1e7aabe5f7ad2d66eb274b0d54568b4110a783dfe8e74bd0f94e3f781  mpd-0.20.14.tar.xz
+sha256  c69c4f67e665380ea3bbde6cff8958edc85f7cd40e7918ae5ce0a2184ca9eb40  mpd-0.20.15.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index f9ca1600b5..482859518a 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.20
-MPD_VERSION = $(MPD_VERSION_MAJOR).14
+MPD_VERSION = $(MPD_VERSION_MAJOR).15
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost
-- 
2.15.1
