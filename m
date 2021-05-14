From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 May 2021 00:02:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXt: add CPE variables
Message-ID: <20210514220212.2276191-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:x:libxt is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax%3Alibxt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xlib_libXt/xlib_libXt.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
index 289cb5ac54..9530262cf5 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ b/package/x11r7/xlib_libXt/xlib_libXt.mk
@@ -10,6 +10,8 @@ XLIB_LIBXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXT_LICENSE = MIT
 XLIB_LIBXT_LICENSE_FILES = COPYING
 XLIB_LIBXT_INSTALL_STAGING = YES
+XLIB_LIBXT_CPE_ID_VENDOR = x
+XLIB_LIBXT_CPE_ID_PRODUCT = libxt
 XLIB_LIBXT_DEPENDENCIES = xlib_libSM xlib_libX11 xorgproto xcb-proto libxcb host-xorgproto
 XLIB_LIBXT_CONF_OPTS = --disable-malloc0returnsnull
 
-- 
2.30.2
