From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Jan 2012 16:02:57 +0100
Subject: [Buildroot] [git commit] xlib_libXcursor: remove redundant
	HOST_XLIB_LIBXCURSOR_DEPENDENCIES
Message-ID: <20120118150408.98FF785779@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97fc987c5f437e7fd42779407a8efaaf3702a303
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index 3c72bbb..d12520a 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
@@ -10,7 +10,5 @@ XLIB_LIBXCURSOR_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXCURSOR_INSTALL_STAGING = YES
 XLIB_LIBXCURSOR_DEPENDENCIES = xlib_libX11 xlib_libXfixes xlib_libXrender xproto_xproto
 
-HOST_XLIB_LIBXCURSOR_DEPENDENCIES = host-xlib_libX11 host-xlib_libXfixes host-xlib_libXrender host-xproto_xproto
-
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
