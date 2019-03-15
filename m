From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:33:09 +0100
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXcomposite: bump
 version to 0.4.5
Message-ID: <20190315203120.985AD83480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbad37fe386048da8158bb924c25cff0811d64d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xlib_libXcomposite/xlib_libXcomposite.hash | 9 +++++++--
 package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.hash b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.hash
index b0c3211f12..37e9c72117 100644
--- a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.hash
+++ b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.hash
@@ -1,2 +1,7 @@
-# From http://lists.freedesktop.org/archives/xorg/2013-January/055221.html
-sha256	ede250cd207d8bee4a338265c3007d7a68d5aca791b6ac41af18e9a2aeb34178	libXcomposite-0.4.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002971.html
+md5 3fa0841ea89024719b20cd702a9b54e0  libXcomposite-0.4.5.tar.bz2
+sha1 902631efb55a798c81086e5ff90b60349839db40  libXcomposite-0.4.5.tar.bz2
+sha256 b3218a2c15bab8035d16810df5b8251ffc7132ff3aa70651a1fba0bfe9634e8f  libXcomposite-0.4.5.tar.bz2
+sha512 502fd51fd9097bb3ca72174ac5b25b9d3b1ff240d32c4765199df03d89337d94b4ddea49e90b177b370862430089d966ce9c38988337156352cfeae911c2d3d5  libXcomposite-0.4.5.tar.bz2
+# Locally computed
+sha256 efa0219ed8485ac555c1a3fb82daf34539b2e0dcf4dadc99c01f1e39c69a4a68  COPYING
diff --git a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
index e84b52e3fd..80e94fe37c 100644
--- a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
+++ b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXCOMPOSITE_VERSION = 0.4.4
+XLIB_LIBXCOMPOSITE_VERSION = 0.4.5
 XLIB_LIBXCOMPOSITE_SOURCE = libXcomposite-$(XLIB_LIBXCOMPOSITE_VERSION).tar.bz2
 XLIB_LIBXCOMPOSITE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXCOMPOSITE_LICENSE = MIT
