From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 13:56:10 +0100
Subject: [Buildroot] [git commit] package/mpd: bump version to 0.20.2
Message-ID: <20170116125851.260D7818AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3376a9ef62df61fc170c49c59e915ac5889d3650
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 258f87b..e1da994 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  48e9dde0f5c22dc26ff36e8d13e3dc575a1ee7558b5537a064f78a3b9dee1619  mpd-0.20.tar.xz
+sha256  552a87d71c2981baeddf28c1856a7e071ea0236dd38bc75ec25d58529605ff77  mpd-0.20.2.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index bee6843..82aca96 100644
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
