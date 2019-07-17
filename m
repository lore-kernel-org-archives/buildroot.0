From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 07:17:11 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_xbiff: bump version to
 1.0.4
Message-ID: <20190717051632.ABA5F7FB47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=143a32b3cf08e1a2c358ca53d3e89ca981fd291e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream, added license hash.
Updated _SITE according to release notes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xapp_xbiff/xapp_xbiff.hash | 9 +++++++--
 package/x11r7/xapp_xbiff/xapp_xbiff.mk   | 4 ++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xbiff/xapp_xbiff.hash b/package/x11r7/xapp_xbiff/xapp_xbiff.hash
index 26bf0ae48d..9c646785d4 100644
--- a/package/x11r7/xapp_xbiff/xapp_xbiff.hash
+++ b/package/x11r7/xapp_xbiff/xapp_xbiff.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2011-January/001595.html
-sha1	17337a951264f0f96f6d03893f9dfd9cf8f12a5a	xbiff-1.0.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-July/003009.html
+md5 66dd3ebd6351b1911b831b89b2dba8ec  xbiff-1.0.4.tar.bz2
+sha1 193c0a2be1f7f374bb9d32217a198c92a63619e8  xbiff-1.0.4.tar.bz2
+sha256 e1e1a39628a5678585008ef7fb1ff2864edaaa0e062989c2331f8c74e0fec971  xbiff-1.0.4.tar.bz2
+sha512 0fb920a08640ec59f23d8a8a47bd244565dfbaff7a21c38a8a2abe1edb5eacabc970b5dbdc409163fc444fde5b75a2dc4e0114312938efec5b77228f3bf785ac  xbiff-1.0.4.tar.bz2
+# Locally computed
+sha256 9b840f2e1900889124cc999f3158da2b6b07bf6d0d77bdbb01ce65d2e702dc83  COPYING
diff --git a/package/x11r7/xapp_xbiff/xapp_xbiff.mk b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
index 73e0350afb..2c3975c167 100644
--- a/package/x11r7/xapp_xbiff/xapp_xbiff.mk
+++ b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XBIFF_VERSION = 1.0.3
+XAPP_XBIFF_VERSION = 1.0.4
 XAPP_XBIFF_SOURCE = xbiff-$(XAPP_XBIFF_VERSION).tar.bz2
-XAPP_XBIFF_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XBIFF_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XBIFF_LICENSE = MIT
 XAPP_XBIFF_LICENSE_FILES = COPYING
 XAPP_XBIFF_DEPENDENCIES = xlib_libXaw xdata_xbitmaps
