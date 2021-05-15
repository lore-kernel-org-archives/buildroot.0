From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 May 2021 13:32:53 +0200
Subject: [Buildroot] [git commit] package/x11r7/libXres: add CPE variables
Message-ID: <20210515111141.E744A83B57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec86e30e66893f4dcb3a0004b152fa075e4db510
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:x:libxres is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax%3Alibxres

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXres/xlib_libXres.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libXres/xlib_libXres.mk b/package/x11r7/xlib_libXres/xlib_libXres.mk
index 1a03745fcf..de3637a04a 100644
--- a/package/x11r7/xlib_libXres/xlib_libXres.mk
+++ b/package/x11r7/xlib_libXres/xlib_libXres.mk
@@ -9,6 +9,8 @@ XLIB_LIBXRES_SOURCE = libXres-$(XLIB_LIBXRES_VERSION).tar.bz2
 XLIB_LIBXRES_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRES_LICENSE = MIT
 XLIB_LIBXRES_LICENSE_FILES = COPYING
+XLIB_LIBXRES_CPE_ID_VENDOR = x
+XLIB_LIBXRES_CPE_ID_PRODUCT = libxres
 XLIB_LIBXRES_INSTALL_STAGING = YES
 XLIB_LIBXRES_DEPENDENCIES = xlib_libX11 xlib_libXext xorgproto
 XLIB_LIBXRES_CONF_OPTS = --disable-malloc0returnsnull
