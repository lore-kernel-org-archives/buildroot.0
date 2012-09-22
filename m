From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:00:50 +0200
Subject: [Buildroot] [git commit] xlib_libXtst: bump version to 1.2.0
Message-ID: <20120922194121.43AD2996DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=54078481d2c87ecbd3d04db4c49b4002bb4100c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_libXtst/xlib_libXtst.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
index d2b5ec5..ea12389 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.mk
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXTST_VERSION = 1.1.0
+XLIB_LIBXTST_VERSION = 1.2.0
 XLIB_LIBXTST_SOURCE = libXtst-$(XLIB_LIBXTST_VERSION).tar.bz2
 XLIB_LIBXTST_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXTST_INSTALL_STAGING = YES
