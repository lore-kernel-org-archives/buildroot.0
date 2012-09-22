From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:12:59 +0200
Subject: [Buildroot] [git commit] xlib_libXi: version bump to 1.4.2
Message-ID: <20120922194124.AE619996CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74eb04a0b2c39cacb0cd6e6cb47389ceaabcbaf9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_libXi/xlib_libXi.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index e52ab7a..b658df6 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXI_VERSION = 1.3
+XLIB_LIBXI_VERSION = 1.4.2
 XLIB_LIBXI_SOURCE = libXi-$(XLIB_LIBXI_VERSION).tar.bz2
 XLIB_LIBXI_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXI_INSTALL_STAGING = YES
