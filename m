From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 30 Jun 2019 10:50:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/xlib_libX11: remove unrecognized
 option
Message-ID: <20190630085018.16819-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove --with-xcb as this option has been removed since version 1.3.99:
https://cgit.freedesktop.org/xorg/lib/libX11/commit/?id=15e5eaf62897b3179d1fbe457cb19f886f0449f8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xlib_libX11/xlib_libX11.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index f0e52e0877..8d4f55b163 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -29,7 +29,6 @@ HOST_XLIB_LIBX11_DEPENDENCIES = \
 
 XLIB_LIBX11_CONF_OPTS = \
 	--disable-malloc0returnsnull \
-	--with-xcb \
 	--disable-specs \
 	--without-perl
 
-- 
2.14.1
