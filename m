From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Mar 2019 21:14:34 +0100
Subject: [Buildroot] [PATCH 04/12] package/x11r7/xlib_libXext: bump version
 to 1.3.4
In-Reply-To: <20190324201443.21347-1-bernd.kuhls@t-online.de>
References: <20190324201443.21347-1-bernd.kuhls@t-online.de>
Message-ID: <20190324201443.21347-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXext/xlib_libXext.hash | 9 +++++++--
 package/x11r7/xlib_libXext/xlib_libXext.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXext/xlib_libXext.hash b/package/x11r7/xlib_libXext/xlib_libXext.hash
index 45b754448c..45810d5d14 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.hash
+++ b/package/x11r7/xlib_libXext/xlib_libXext.hash
@@ -1,2 +1,7 @@
-# From http://lists.freedesktop.org/pipermail/xorg/2014-July/056771.html
-sha256	b518d4d332231f313371fdefac59e3776f4f0823bcb23cf7c7305bfb57b16e35	libXext-1.3.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002975.html
+md5 f5b48bb76ba327cd2a8dc7a383532a95  libXext-1.3.4.tar.bz2
+sha1 14e2451162e8766173b5b14c73e94a22b1fcab55  libXext-1.3.4.tar.bz2
+sha256 59ad6fcce98deaecc14d39a672cf218ca37aba617c9a0f691cac3bcd28edf82b  libXext-1.3.4.tar.bz2
+sha512 09146397d95f80c04701be1cc0a9c580ab5a085842ac31d17dfb6d4c2e42b4253b89cba695e54444e520be359883a76ffd02f42484c9e2ba2c33a5a40c29df4a  libXext-1.3.4.tar.bz2
+# Locally computed
+sha256 80767ac915f2f0f94de9efb15f0197a59b6f1e609cae85059f8703272dc3e146  COPYING
diff --git a/package/x11r7/xlib_libXext/xlib_libXext.mk b/package/x11r7/xlib_libXext/xlib_libXext.mk
index 02fee222b6..c63a3b23cc 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.mk
+++ b/package/x11r7/xlib_libXext/xlib_libXext.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXEXT_VERSION = 1.3.3
+XLIB_LIBXEXT_VERSION = 1.3.4
 XLIB_LIBXEXT_SOURCE = libXext-$(XLIB_LIBXEXT_VERSION).tar.bz2
 XLIB_LIBXEXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXEXT_LICENSE = MIT
-- 
2.20.1
