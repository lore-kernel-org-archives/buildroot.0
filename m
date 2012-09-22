From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:16:34 +0200
Subject: [Buildroot] [git commit] xlib_libXext: version bump to 1.2.0
Message-ID: <20120922194126.6B110996DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f26cc6660111607d35e84c7da4772f78b78feb7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_libXext/xlib_libXext.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXext/xlib_libXext.mk b/package/x11r7/xlib_libXext/xlib_libXext.mk
index 14f8f5e..2ce38ef 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.mk
+++ b/package/x11r7/xlib_libXext/xlib_libXext.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXEXT_VERSION = 1.1.1
+XLIB_LIBXEXT_VERSION = 1.2.0
 XLIB_LIBXEXT_SOURCE = libXext-$(XLIB_LIBXEXT_VERSION).tar.bz2
 XLIB_LIBXEXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXEXT_INSTALL_STAGING = YES
