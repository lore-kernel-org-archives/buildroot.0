From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 16 Jul 2019 21:49:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libICE: security bump
 version to 1.0.10
Message-ID: <20190716194934.25555-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2017-2626, release notes:
https://lists.x.org/archives/xorg-announce/2019-July/003006.html

Added all hashes provided by upstream, added license hash.
Updated _SITE according to release notes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libICE/xlib_libICE.hash | 9 +++++++--
 package/x11r7/xlib_libICE/xlib_libICE.mk   | 4 ++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libICE/xlib_libICE.hash b/package/x11r7/xlib_libICE/xlib_libICE.hash
index 1b006ce36b..426ada32a4 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.hash
+++ b/package/x11r7/xlib_libICE/xlib_libICE.hash
@@ -1,2 +1,7 @@
-# From http://lists.freedesktop.org/pipermail/xorg/2014-June/056671.html
-sha256	8f7032f2c1c64352b5423f6b48a8ebdc339cc63064af34d66a6c9aa79759e202	libICE-1.0.9.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-July/003006.html
+md5 76d77499ee7120a56566891ca2c0dbcf  libICE-1.0.10.tar.bz2
+sha1 5b5eb125d4f43a3ab8153b0f850963ee6c982c24  libICE-1.0.10.tar.bz2
+sha256 6f86dce12cf4bcaf5c37dddd8b1b64ed2ddf1ef7b218f22b9942595fb747c348  libICE-1.0.10.tar.bz2
+sha512 2f1ef2c32c833c71894a08fa7e7ed53f301f6c7bd22485d71c12884d8e8b36b99f362ec886349dcc84d08edc81c8b2cea035320831d64974edeba021b433c468  libICE-1.0.10.tar.bz2
+# Locally computed
+sha256 60105b7ea93cb07a67fee8443b092b727e3db7f0dff4fbe05bc6cd7747fb53c8  COPYING
diff --git a/package/x11r7/xlib_libICE/xlib_libICE.mk b/package/x11r7/xlib_libICE/xlib_libICE.mk
index 982e8fdef1..0b1f8ade17 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.mk
+++ b/package/x11r7/xlib_libICE/xlib_libICE.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBICE_VERSION = 1.0.9
+XLIB_LIBICE_VERSION = 1.0.10
 XLIB_LIBICE_SOURCE = libICE-$(XLIB_LIBICE_VERSION).tar.bz2
-XLIB_LIBICE_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBICE_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBICE_LICENSE = MIT
 XLIB_LIBICE_LICENSE_FILES = COPYING
 XLIB_LIBICE_INSTALL_STAGING = YES
-- 
2.20.1
