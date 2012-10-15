From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Oct 2012 13:55:05 +0200
Subject: [Buildroot] [git commit] xlib_libXrender: bump to 0.9.7
Message-ID: <20121015115601.19F10997E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ce5da6e3fd0d2950e84bcfcef80f1fb68139d6c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_libXrender/xlib_libXrender.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
index 466b433..fbd5015 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXRENDER_VERSION = 0.9.6
+XLIB_LIBXRENDER_VERSION = 0.9.7
 XLIB_LIBXRENDER_SOURCE = libXrender-$(XLIB_LIBXRENDER_VERSION).tar.bz2
 XLIB_LIBXRENDER_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRENDER_INSTALL_STAGING = YES
