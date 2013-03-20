From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:01 +0100
Subject: [Buildroot] [git commit] xlib_libXv: bump revision to X11R7.7
Message-ID: <20130324225153.551BC9B226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1d618d26c2d2a5b7aaf43273a7a1247c7f0b5fdb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/xlib_libXv/xlib_libXv.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXv/xlib_libXv.mk b/package/x11r7/xlib_libXv/xlib_libXv.mk
index 8d69217..06c1145 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.mk
+++ b/package/x11r7/xlib_libXv/xlib_libXv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXV_VERSION = 1.0.6
+XLIB_LIBXV_VERSION = 1.0.7
 XLIB_LIBXV_SOURCE = libXv-$(XLIB_LIBXV_VERSION).tar.bz2
 XLIB_LIBXV_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXV_INSTALL_STAGING = YES
