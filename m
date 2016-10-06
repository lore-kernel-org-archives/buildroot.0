From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  6 Oct 2016 07:28:40 +0200
Subject: [Buildroot] [PATCH 11/11] package/x11r7/xlib_libXvMC: security bump
	to 1.0.10
In-Reply-To: <20161006052840.12339-1-bernd.kuhls@t-online.de>
References: <20161006052840.12339-1-bernd.kuhls@t-online.de>
Message-ID: <20161006052840.12339-11-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please see the security advisory for details:
https://lists.x.org/archives/xorg-announce/2016-October/002720.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXvMC/xlib_libXvMC.hash | 5 ++---
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash b/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
index f0fcd2d..380c811 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
@@ -1,3 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-March/002548.html
-sha1	6fc54831734e781b2848b6f7e3bcc4f752665f21				libXvMC-1.0.9.tar.bz2
-sha256	0703d7dff6ffc184f1735ca5d4eb9dbb402b522e08e008f2f96aee16c40a5756	libXvMC-1.0.9.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-October/002728.html
+sha256 e501a079b5dfaef0897c56152770c77e05e362065cec58910289aa567277ee2e  libXvMC-1.0.10.tar.bz2
diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
index 101c15d..cb39c29 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXVMC_VERSION = 1.0.9
+XLIB_LIBXVMC_VERSION = 1.0.10
 XLIB_LIBXVMC_SOURCE = libXvMC-$(XLIB_LIBXVMC_VERSION).tar.bz2
 XLIB_LIBXVMC_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXVMC_LICENSE = MIT
-- 
2.9.3
