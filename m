From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Nov 2018 22:27:51 +0100
Subject: [Buildroot] [git commit] package/mpd: bump to version 0.20.23
Message-ID: <20181109212522.063D2821D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9eadab1bfac0e3cbfe857cca0978049130444675
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index f48782be39..b80bfc82a4 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  8322764dc265c20f05c8c8fdfdd578b0722e74626bef56fcd8eebfb01acc58dc  mpd-0.20.21.tar.xz
+sha256  503e5f9f237290f568ff7956ab2f9aed563594bf749f19b8fe994fb21434afea  mpd-0.20.23.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index b61a4627d2..f410c1fd95 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.20
-MPD_VERSION = $(MPD_VERSION_MAJOR).21
+MPD_VERSION = $(MPD_VERSION_MAJOR).23
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost
