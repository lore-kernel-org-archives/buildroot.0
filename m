From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Jan 2012 16:02:57 +0100
Subject: [Buildroot] [git commit] xlib_libXrender: remove redundant
	HOST_XLIB_LIBXRENDER_DEPENDENCIES
Message-ID: <20120118150408.B777085779@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ab51b67a856e3513eb11e44cdff395a92b92c6e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_libXrender/xlib_libXrender.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
index 9a2abe3..7a0a45e 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
@@ -11,7 +11,5 @@ XLIB_LIBXRENDER_INSTALL_STAGING = YES
 XLIB_LIBXRENDER_DEPENDENCIES = xlib_libX11 xproto_renderproto xproto_xproto
 XLIB_LIBXRENDER_CONF_OPT = --disable-malloc0returnsnull
 
-HOST_XLIB_LIBXRENDER_DEPENDENCIES = host-xlib_libX11 host-xproto_renderproto host-xproto_xproto
-
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
