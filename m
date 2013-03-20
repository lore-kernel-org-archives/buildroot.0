From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:01 +0100
Subject: [Buildroot] [git commit] xlib_libXau: bump revision to X11R7.7
Message-ID: <20130324225149.1B1459B1CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe3c3f53971122473c5321328b6b405d47bd0ab5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/xlib_libXau/xlib_libXau.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
index 6a228a2..dc7f91e 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXAU_VERSION = 1.0.6
+XLIB_LIBXAU_VERSION = 1.0.7
 XLIB_LIBXAU_SOURCE = libXau-$(XLIB_LIBXAU_VERSION).tar.bz2
 XLIB_LIBXAU_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXAU_INSTALL_STAGING = YES
