From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri,  5 Aug 2016 21:25:45 +0200
Subject: [Buildroot] [PATCH] package/mpd: bump to version 0.19.18
Message-ID: <20160805192545.16544-1-joerg.krause@embedded.rocks>
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
index 2395cb7..4b564bf 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  487ec8ad2b1c1c193c2a7c8975a8b8fe2e4f0335bcc2e9356b2b34a0179fb2f7  mpd-0.19.17.tar.xz
+sha256  764c991c54980cb97e876e3f65d63410c0c561b7be996b832e058053e005ed47  mpd-0.19.18.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 6e2cf8c..e88261d 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.19
-MPD_VERSION = $(MPD_VERSION_MAJOR).17
+MPD_VERSION = $(MPD_VERSION_MAJOR).18
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost libglib2
-- 
2.9.2
