From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 25 Sep 2016 15:35:59 +0200
Subject: [Buildroot] [PATCH 5/6] package/x11r7/xlib_libXfont: bump version
	to 1.5.2
In-Reply-To: <20160925133600.12316-1-bernd.kuhls@t-online.de>
References: <20160925133600.12316-1-bernd.kuhls@t-online.de>
Message-ID: <20160925133600.12316-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXfont/xlib_libXfont.hash | 4 ++--
 package/x11r7/xlib_libXfont/xlib_libXfont.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.hash b/package/x11r7/xlib_libXfont/xlib_libXfont.hash
index 9543637..6db8339 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.hash
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-March/002551.html
-sha256	b70898527c73f9758f551bbab612af611b8a0962202829568d94f3edf4d86098	libXfont-1.5.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-August/002702.html
+sha256 02945ea68da447102f3e6c2b896c1d2061fd115de99404facc2aca3ad7010d71  libXfont-1.5.2.tar.bz2
diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index d7acab4..422c01d 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFONT_VERSION = 1.5.1
+XLIB_LIBXFONT_VERSION = 1.5.2
 XLIB_LIBXFONT_SOURCE = libXfont-$(XLIB_LIBXFONT_VERSION).tar.bz2
 XLIB_LIBXFONT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFONT_LICENSE = MIT
-- 
2.9.3
