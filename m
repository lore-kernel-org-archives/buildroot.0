From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Oct 2019 09:49:15 +0200
Subject: [Buildroot] [git commit] package/mpd: bump to version 0.21.16
Message-ID: <20191017074408.3A4A881D31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ddb2812dfc71b30716e36e5fe6d9c8518b46476f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
