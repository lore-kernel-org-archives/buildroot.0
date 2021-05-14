From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 14 May 2021 23:44:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXfixes: add CPE
 variables
Message-ID: <20210514214444.2275124-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:x:libxfixes is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax%3Alibxfixes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
index f563ba34ec..6674cccb64 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
@@ -9,6 +9,8 @@ XLIB_LIBXFIXES_SOURCE = libXfixes-$(XLIB_LIBXFIXES_VERSION).tar.bz2
 XLIB_LIBXFIXES_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFIXES_LICENSE = MIT
 XLIB_LIBXFIXES_LICENSE_FILES = COPYING
+XLIB_LIBXFIXES_CPE_ID_VENDOR = x
+XLIB_LIBXFIXES_CPE_ID_PRODUCT = libxfixes
 XLIB_LIBXFIXES_INSTALL_STAGING = YES
 XLIB_LIBXFIXES_DEPENDENCIES =  xlib_libX11 xorgproto
 HOST_XLIB_LIBXFIXES_DEPENDENCIES = \
-- 
2.30.2
