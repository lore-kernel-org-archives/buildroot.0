From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 07 Jun 2021 15:17:49 -0000
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXfixes: bump version
 to 6.0.0
Message-ID: <20210607144654.7328581191@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=daf7104a41d05146932efa4b6d81f4e3e4eb3277
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2021-May/003086.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xlib_libXfixes/xlib_libXfixes.hash | 5 +++--
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash b/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
index d655be4f71..f40c522903 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
@@ -1,5 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2016-October/002722.html
-sha256 de1cd33aff226e08cefd0e6759341c2c8e8c9faf8ce9ac6ec38d43e287b22ad6  libXfixes-5.0.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-May/003086.html
+sha256  a7c1a24da53e0b46cac5aea79094b4b2257321c621b258729bc3139149245b4c  libXfixes-6.0.0.tar.bz2
+sha512  1985ef156f382e9a7e1cc7e044e0f626de1e4c82557a511cbcf6431994c0ac25b1f8b3a0293bd3089331593db8ce01d3a71ddec68f19b5fe6029d5082fb6885d  libXfixes-6.0.0.tar.bz2
 
 # Locally calculated
 sha256 d64e671ffeb483d4543f98c842788ab34c77427e27d83d6b082065a4438d4885  COPYING
diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
index f563ba34ec..a149ba9fab 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFIXES_VERSION = 5.0.3
+XLIB_LIBXFIXES_VERSION = 6.0.0
 XLIB_LIBXFIXES_SOURCE = libXfixes-$(XLIB_LIBXFIXES_VERSION).tar.bz2
 XLIB_LIBXFIXES_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFIXES_LICENSE = MIT
