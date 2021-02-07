From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Feb 2021 14:45:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXrender: add CPE
 variables
Message-ID: <20210207134510.2943565-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:x.org:libxrender is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax.org%3Alibxrender

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xlib_libXrender/xlib_libXrender.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
index 870f94386e..0ef0ec48d9 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
@@ -9,6 +9,8 @@ XLIB_LIBXRENDER_SOURCE = libXrender-$(XLIB_LIBXRENDER_VERSION).tar.bz2
 XLIB_LIBXRENDER_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRENDER_LICENSE = MIT
 XLIB_LIBXRENDER_LICENSE_FILES = COPYING
+XLIB_LIBXRENDER_CPE_ID_VENDOR = x.org
+XLIB_LIBXRENDER_CPE_ID_PRODUCT = libxrender
 XLIB_LIBXRENDER_INSTALL_STAGING = YES
 XLIB_LIBXRENDER_DEPENDENCIES = xlib_libX11 xorgproto
 HOST_XLIB_LIBXRENDER_DEPENDENCIES = \
-- 
2.29.2
