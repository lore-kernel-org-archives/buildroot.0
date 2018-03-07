From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Mar 2018 22:21:36 +0100
Subject: [Buildroot] [git commit] mpd: bump to version 0.20.18
Message-ID: <20180307212153.6AEA482645@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf26f87b851291acf4c1906ce2520bb6d9e05e05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash for license file.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/mpd.hash | 3 ++-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 735ea700ff..d6e66216cf 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  c69c4f67e665380ea3bbde6cff8958edc85f7cd40e7918ae5ce0a2184ca9eb40  mpd-0.20.15.tar.xz
+sha256  6a582dc2ae90b94ff3853f9ffd7d80b2c2b5fe2e2c35cb1da0b36f3f3dfad434  mpd-0.20.18.tar.xz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 482859518a..26e82af0a8 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.20
-MPD_VERSION = $(MPD_VERSION_MAJOR).15
+MPD_VERSION = $(MPD_VERSION_MAJOR).18
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost
