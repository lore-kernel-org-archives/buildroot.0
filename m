From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 15:29:20 +0200
Subject: [Buildroot] [git commit] package/xlib_libX11: remove unrecognized
 option
Message-ID: <20190801132736.051FA7FA24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5cb2812fdba93ae72201c41a7ea076cd1f1a7bed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove --with-xcb as this option has been removed since version 1.3.99:
https://cgit.freedesktop.org/xorg/lib/libX11/commit/?id=15e5eaf62897b3179d1fbe457cb19f886f0449f8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libX11/xlib_libX11.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index c51bb53cdb..7c34b97c8d 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -30,7 +30,6 @@ HOST_XLIB_LIBX11_DEPENDENCIES = \
 
 XLIB_LIBX11_CONF_OPTS = \
 	--disable-malloc0returnsnull \
-	--with-xcb \
 	--disable-specs \
 	--without-perl
 
