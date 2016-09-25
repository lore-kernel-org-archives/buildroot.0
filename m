From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Sep 2016 23:12:59 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXfont: bump version
	to 1.5.2
Message-ID: <20160925211322.5318280125@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1038703ce28fa13be0e2a60b1ce5a3909a3ae295
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
