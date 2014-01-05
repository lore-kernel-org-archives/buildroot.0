From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2014 22:56:28 +0100
Subject: [Buildroot] [git commit] xorg: Bump xlib_libXt version to 1.1.4
Message-ID: <20140105230942.E168B9C3D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9da193de740405b18af8ac61757cefb37d304a18
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXt/xlib_libXt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
index f186df0..edb01c1 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ b/package/x11r7/xlib_libXt/xlib_libXt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXT_VERSION = 1.1.3
+XLIB_LIBXT_VERSION = 1.1.4
 XLIB_LIBXT_SOURCE = libXt-$(XLIB_LIBXT_VERSION).tar.bz2
 XLIB_LIBXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXT_LICENSE = MIT
