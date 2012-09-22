From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:11:05 +0200
Subject: [Buildroot] [git commit] xlib_libXp: version bump to 1.0.1
Message-ID: <20120922194123.6348F996CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c38d7f302e45b4a5228de11c9b410bebb0a705ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_libXp/xlib_libXp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXp/xlib_libXp.mk b/package/x11r7/xlib_libXp/xlib_libXp.mk
index 08891ad..9b2e4de 100644
--- a/package/x11r7/xlib_libXp/xlib_libXp.mk
+++ b/package/x11r7/xlib_libXp/xlib_libXp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXP_VERSION = 1.0.0
+XLIB_LIBXP_VERSION = 1.0.1
 XLIB_LIBXP_SOURCE = libXp-$(XLIB_LIBXP_VERSION).tar.bz2
 XLIB_LIBXP_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXP_INSTALL_STAGING = YES
