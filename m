From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jan 2020 20:04:12 +0100
Subject: [Buildroot] [git commit] package/mpd: bump version to 0.21.19
Message-ID: <20200120185402.4260F82B97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6c9a90db59a5388bebb9095ec5d00264774dd86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 798dd73369..ecc2ee42a5 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  30cf1bddf7d7388487276745ad3515f134e07f0c57f9f97cb2b5d3befd4a4d92  mpd-0.21.16.tar.xz
+sha256  d3275e11d85637adde250cadf3b4f5aec2144228f0d8085767493fc46c55b2f9  mpd-0.21.19.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 6e980b8df1..647cac4f32 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.21
-MPD_VERSION = $(MPD_VERSION_MAJOR).16
+MPD_VERSION = $(MPD_VERSION_MAJOR).19
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost
