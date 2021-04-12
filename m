From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 12 Apr 2021 09:29:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpd: bump to version 0.22.6
Message-ID: <20210412072958.4805-1-joerg.krause@embedded.rocks>
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
index 866c61d15f..4c3b49823b 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  338012037b5e67730529187c555a54cc567a85b15a7e8ddb3a807b1971566ccf  mpd-0.22.3.tar.xz
+sha256  2be149a4895c3cb613477f8cf1193593e3d8a1d38a75ffa7d32da8c8316a4d5e  mpd-0.22.6.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 5dfb5b42a4..06dc7e15d7 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.22
-MPD_VERSION = $(MPD_VERSION_MAJOR).3
+MPD_VERSION = $(MPD_VERSION_MAJOR).6
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost
-- 
2.31.1
