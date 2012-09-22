From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:00:39 +0200
Subject: [Buildroot] [git commit] xlib_libXxf86dga: bump version to 1.1.2
Message-ID: <20120922194120.7250B996CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3bb41fc8c409f8bc37c5bd7663b7541a259cb944
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
index d046426..2bd9ce7 100644
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
+++ b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXXF86DGA_VERSION = 1.1.1
+XLIB_LIBXXF86DGA_VERSION = 1.1.2
 XLIB_LIBXXF86DGA_SOURCE = libXxf86dga-$(XLIB_LIBXXF86DGA_VERSION).tar.bz2
 XLIB_LIBXXF86DGA_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXXF86DGA_INSTALL_STAGING = YES
