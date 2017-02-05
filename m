From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun,  5 Feb 2017 15:13:51 +0100
Subject: [Buildroot] [PATCH] package/mpd: bump to version 0.20.4
Message-ID: <20170205141351.13974-1-joerg.krause@embedded.rocks>
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
index e4709e691..ee46f3cc5 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  2238c1233f5318800ede7c37eeaf705c04920315de572dc666aff6ca682eb0f9  mpd-0.20.3.tar.xz
+sha256  712b25351c12616630c580204e1c3dcba3ae2993a56cff1c346c87e334d69728  mpd-0.20.4.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 527de7751..0efc8685f 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.20
-MPD_VERSION = $(MPD_VERSION_MAJOR).3
+MPD_VERSION = $(MPD_VERSION_MAJOR).4
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost
-- 
2.11.1
