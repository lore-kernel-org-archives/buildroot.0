From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:00:46 +0200
Subject: [Buildroot] [git commit] xlib_libXv: bump version to 1.0.6
Message-ID: <20120922194120.F3D57996CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=178c388c2d7ae188c572dc347b84c27489154a1d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_libXv/xlib_libXv.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXv/xlib_libXv.mk b/package/x11r7/xlib_libXv/xlib_libXv.mk
index af08937..8d69217 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.mk
+++ b/package/x11r7/xlib_libXv/xlib_libXv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXV_VERSION = 1.0.5
+XLIB_LIBXV_VERSION = 1.0.6
 XLIB_LIBXV_SOURCE = libXv-$(XLIB_LIBXV_VERSION).tar.bz2
 XLIB_LIBXV_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXV_INSTALL_STAGING = YES
