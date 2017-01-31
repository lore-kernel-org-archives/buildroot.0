From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 31 Jan 2017 19:37:46 +0100
Subject: [Buildroot] [PATCH 12/16] package/x11r7/xlib_libXi: bump version to
	1.7.9
In-Reply-To: <20170131183750.15481-1-bernd.kuhls@t-online.de>
References: <20170131183750.15481-1-bernd.kuhls@t-online.de>
Message-ID: <20170131183750.15481-12-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXi/xlib_libXi.hash | 4 ++--
 package/x11r7/xlib_libXi/xlib_libXi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXi/xlib_libXi.hash b/package/x11r7/xlib_libXi/xlib_libXi.hash
index e7a4032fb..9f2c3e30b 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.hash
+++ b/package/x11r7/xlib_libXi/xlib_libXi.hash
@@ -1,2 +1,2 @@
-# From https://lists.x.org/archives/xorg-announce/2016-October/002733.html
-sha256 d8f2fa8d53141c41ff521627df9b2fa9c05f6f142fd9881152bab36549ac27bb  libXi-1.7.8.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-January/002768.html
+sha256 c2e6b8ff84f9448386c1b5510a5cf5a16d788f76db018194dacdc200180faf45  libXi-1.7.9.tar.bz2
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index de680ea05..d593c1e95 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXI_VERSION = 1.7.8
+XLIB_LIBXI_VERSION = 1.7.9
 XLIB_LIBXI_SOURCE = libXi-$(XLIB_LIBXI_VERSION).tar.bz2
 XLIB_LIBXI_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXI_LICENSE = MIT
-- 
2.11.0
