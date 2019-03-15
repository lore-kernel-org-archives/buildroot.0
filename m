From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:33:09 +0100
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXdamage: bump
 version to 1.1.5
Message-ID: <20190315203120.A5D5383480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ecf804cffb4475dab4eae8e9534ad874eb7a1c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xlib_libXdamage/xlib_libXdamage.hash | 9 +++++++--
 package/x11r7/xlib_libXdamage/xlib_libXdamage.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXdamage/xlib_libXdamage.hash b/package/x11r7/xlib_libXdamage/xlib_libXdamage.hash
index 343cbf4a68..120d3e026a 100644
--- a/package/x11r7/xlib_libXdamage/xlib_libXdamage.hash
+++ b/package/x11r7/xlib_libXdamage/xlib_libXdamage.hash
@@ -1,2 +1,7 @@
-# From http://lists.freedesktop.org/archives/xorg/2013-January/055220.html
-sha256	7c3fe7c657e83547f4822bfde30a90d84524efb56365448768409b77f05355ad	libXdamage-1.1.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002973.html
+md5 e3f554267a7a04b042dc1f6352bd6d99  libXdamage-1.1.5.tar.bz2
+sha1 719ae6ab8c1b972c6386b654976c479255af5572  libXdamage-1.1.5.tar.bz2
+sha256 b734068643cac3b5f3d2c8279dd366b5bf28c7219d9e9d8717e1383995e0ea45  libXdamage-1.1.5.tar.bz2
+sha512 a3ca6cc33b1727f717a3e2aa5593f660508a81a47918a0aa949e9e8fba105e303fe5071983b48caac92feea0fe6e8e01620805e4d19b41f21f20d837b191c124  libXdamage-1.1.5.tar.bz2
+# Locally computed
+sha256 33effe928634be12e668465c3935c5570ff2787b970b15d9243d69df42302c57  COPYING
diff --git a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
index d52b4e0e24..cc5493ff6c 100644
--- a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
+++ b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXDAMAGE_VERSION = 1.1.4
+XLIB_LIBXDAMAGE_VERSION = 1.1.5
 XLIB_LIBXDAMAGE_SOURCE = libXdamage-$(XLIB_LIBXDAMAGE_VERSION).tar.bz2
 XLIB_LIBXDAMAGE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXDAMAGE_LICENSE = MIT
