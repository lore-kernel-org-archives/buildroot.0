From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 15 Jan 2017 21:34:34 +0100
Subject: [Buildroot] [PATCH 1/2] package/mpd: bump version to 0.20.2
Message-ID: <20170115203435.908-1-joerg.krause@embedded.rocks>
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
index 258f87b7b..e1da99475 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  48e9dde0f5c22dc26ff36e8d13e3dc575a1ee7558b5537a064f78a3b9dee1619  mpd-0.20.tar.xz
+sha256  552a87d71c2981baeddf28c1856a7e071ea0236dd38bc75ec25d58529605ff77  mpd-0.20.2.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index bee68436d..82aca9665 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.20
-MPD_VERSION = $(MPD_VERSION_MAJOR)
+MPD_VERSION = $(MPD_VERSION_MAJOR).2
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost libglib2
-- 
2.11.0
