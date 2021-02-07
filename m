From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Feb 2021 14:47:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXv: add CPE variables
Message-ID: <20210207134750.2943790-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:x.org:libxv is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax.org%3Alibxv

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xlib_libXv/xlib_libXv.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libXv/xlib_libXv.mk b/package/x11r7/xlib_libXv/xlib_libXv.mk
index 0ff99b9380..1105b5925d 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.mk
+++ b/package/x11r7/xlib_libXv/xlib_libXv.mk
@@ -9,6 +9,8 @@ XLIB_LIBXV_SOURCE = libXv-$(XLIB_LIBXV_VERSION).tar.bz2
 XLIB_LIBXV_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXV_LICENSE = ISC-like
 XLIB_LIBXV_LICENSE_FILES = COPYING
+XLIB_LIBXV_CPE_ID_VENDOR = x.org
+XLIB_LIBXV_CPE_ID_PRODUCT = libxv
 XLIB_LIBXV_INSTALL_STAGING = YES
 XLIB_LIBXV_DEPENDENCIES = xlib_libX11 xlib_libXext xorgproto
 XLIB_LIBXV_CONF_OPTS = --disable-malloc0returnsnull
-- 
2.29.2
