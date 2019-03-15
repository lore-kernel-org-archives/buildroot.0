From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:33:09 +0100
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXau: bump version to
 1.0.9
Message-ID: <20190315203120.9059D83480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa1a1d21562d6d5d967287f2193ad7fe04b1cbd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xlib_libXau/xlib_libXau.hash | 9 +++++++--
 package/x11r7/xlib_libXau/xlib_libXau.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXau/xlib_libXau.hash b/package/x11r7/xlib_libXau/xlib_libXau.hash
index b6c8de73c1..a78d7f0fea 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.hash
+++ b/package/x11r7/xlib_libXau/xlib_libXau.hash
@@ -1,2 +1,7 @@
-# From http://lists.freedesktop.org/archives/xorg/2013-May/055728.html
-sha256	fdd477320aeb5cdd67272838722d6b7d544887dfe7de46e1e7cc0c27c2bea4f2	libXau-1.0.8.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-February/002942.html
+md5 c5f16288f2da9f071b29111d68797480  libXau-1.0.9.tar.bz2
+sha1 ef9b1ad00f958c8b6e30a1bbc11fdfac311c9733  libXau-1.0.9.tar.bz2
+sha256 ccf8cbf0dbf676faa2ea0a6d64bcc3b6746064722b606c8c52917ed00dcb73ec  libXau-1.0.9.tar.bz2
+sha512 3ca454ba466a807ea28b0f715066d73dc76ad312697b121d43e4d5766215052e9b7ffb8fe3ed3e496fa3f2a13f164ac692ff85cc428e26731b679f0f06a1d562  libXau-1.0.9.tar.bz2
+# Locally computed
+sha256 56abe29bb1d9806a9e04fa9f80fed2c0f18027594df3f098148d814aef6bddfa  COPYING
diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
index 0fc78e7068..bac10818f1 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXAU_VERSION = 1.0.8
+XLIB_LIBXAU_VERSION = 1.0.9
 XLIB_LIBXAU_SOURCE = libXau-$(XLIB_LIBXAU_VERSION).tar.bz2
 XLIB_LIBXAU_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXAU_LICENSE = MIT
