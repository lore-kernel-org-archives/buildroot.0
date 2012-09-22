From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:09:25 +0200
Subject: [Buildroot] [git commit] xlib_libXres: version bump to 1.0.5
Message-ID: <20120922194122.28AB9996DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4610bf7c1055e2dc2865a602d77bd49c177593c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_libXres/xlib_libXres.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXres/xlib_libXres.mk b/package/x11r7/xlib_libXres/xlib_libXres.mk
index 0ecb928..8b6e31b 100644
--- a/package/x11r7/xlib_libXres/xlib_libXres.mk
+++ b/package/x11r7/xlib_libXres/xlib_libXres.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXRES_VERSION = 1.0.4
+XLIB_LIBXRES_VERSION = 1.0.5
 XLIB_LIBXRES_SOURCE = libXres-$(XLIB_LIBXRES_VERSION).tar.bz2
 XLIB_LIBXRES_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRES_INSTALL_STAGING = YES
