From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 16 Jul 2019 22:09:51 +0200
Subject: [Buildroot] [PATCH 2/3] package/x11r7/xapp_xman: bump version to
 1.1.5
In-Reply-To: <20190716200952.26909-1-bernd.kuhls@t-online.de>
References: <20190716200952.26909-1-bernd.kuhls@t-online.de>
Message-ID: <20190716200952.26909-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream, added license hash.
Updated _SITE according to release notes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xman/xapp_xman.hash | 10 +++++++---
 package/x11r7/xapp_xman/xapp_xman.mk   |  4 ++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xman/xapp_xman.hash b/package/x11r7/xapp_xman/xapp_xman.hash
index 00a4d85bba..e4a93d170c 100644
--- a/package/x11r7/xapp_xman/xapp_xman.hash
+++ b/package/x11r7/xapp_xman/xapp_xman.hash
@@ -1,3 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-March/002541.html
-sha1	b64516dab2b1c407b28ce3822a98b93178e29f02				xman-1.1.4.tar.bz2
-sha256	b3fa9d2e3f3745c529eb0b6ee4f0e00d936457d11e5221b2efad06ff7c84df29	xman-1.1.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-July/003011.html
+md5 629436867b202098967636b17c8d303c  xman-1.1.5.tar.bz2
+sha1 ec76dbd010f68974e05dfe8bc4b91731a3b7285b  xman-1.1.5.tar.bz2
+sha256 4e3c2c7497e9734a6d3c8e1b6a364612892bb31e9f33076c9fdae7177ab60978  xman-1.1.5.tar.bz2
+sha512 f6b2be424a79f298bf1a81edce4172572195c9efc9454e5b7b7046f344ed08154c77ccaa763ccdf3f1a30b64aa4802783bf813ee637437ccb1fba434fc5d4400  xman-1.1.5.tar.bz2
+# Locally computed
+sha256 4c3d6d6fc5661c64285931a0871728f3745d962d877477235dc66e4043db3d36  COPYING
diff --git a/package/x11r7/xapp_xman/xapp_xman.mk b/package/x11r7/xapp_xman/xapp_xman.mk
index 0d744cc390..f8abfe577d 100644
--- a/package/x11r7/xapp_xman/xapp_xman.mk
+++ b/package/x11r7/xapp_xman/xapp_xman.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XMAN_VERSION = 1.1.4
+XAPP_XMAN_VERSION = 1.1.5
 XAPP_XMAN_SOURCE = xman-$(XAPP_XMAN_VERSION).tar.bz2
-XAPP_XMAN_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XMAN_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XMAN_LICENSE = MIT
 XAPP_XMAN_LICENSE_FILES = COPYING
 XAPP_XMAN_DEPENDENCIES = xlib_libXaw
-- 
2.20.1
