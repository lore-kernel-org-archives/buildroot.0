From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:17:10 +0200
Subject: [Buildroot] [git commit] xlib_libXdamage: version bump to 1.1.3
Message-ID: <20120922194127.7BFA7996DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f06ae046398ae1fed4c2602bb207a0563b95dbcd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_libXdamage/xlib_libXdamage.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
index 1dd4be1..f4d266e 100644
--- a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
+++ b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXDAMAGE_VERSION = 1.1.2
+XLIB_LIBXDAMAGE_VERSION = 1.1.3
 XLIB_LIBXDAMAGE_SOURCE = libXdamage-$(XLIB_LIBXDAMAGE_VERSION).tar.bz2
 XLIB_LIBXDAMAGE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXDAMAGE_INSTALL_STAGING = YES
