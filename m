From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Jan 2012 16:02:57 +0100
Subject: [Buildroot] [git commit] xlib_libXfixes: remove redundant
	HOST_XLIB_LIBXFIXES_DEPENDENCIES
Message-ID: <20120118150408.A87E185779@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b3daf7849422785696fe197d91631cf9838d1df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
index 2d8b7fa..2db9b36 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
@@ -10,7 +10,5 @@ XLIB_LIBXFIXES_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFIXES_INSTALL_STAGING = YES
 XLIB_LIBXFIXES_DEPENDENCIES = xproto_fixesproto xlib_libX11 xproto_xextproto xproto_xproto
 
-HOST_XLIB_LIBXFIXES_DEPENDENCIES = host-xproto_fixesproto host-xlib_libX11 host-xproto_xextproto host-xproto_xproto
-
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
