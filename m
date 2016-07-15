From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 15 Jul 2016 08:38:44 +0200
Subject: [Buildroot] [PATCH] package/mpd: bump to version 0.19.17
Message-ID: <20160715063844.7976-1-joerg.krause@embedded.rocks>
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
index cc2cebc..2395cb7 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  58ecbff4b07ec42a6f31bdbbb3c3eb51317978e4a0ea3071f6ae6127848a03d6  mpd-0.19.16.tar.xz
+sha256  487ec8ad2b1c1c193c2a7c8975a8b8fe2e4f0335bcc2e9356b2b34a0179fb2f7  mpd-0.19.17.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 75f8bb4..6e2cf8c 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.19
-MPD_VERSION = $(MPD_VERSION_MAJOR).16
+MPD_VERSION = $(MPD_VERSION_MAJOR).17
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost libglib2
-- 
2.9.0
