From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 May 2021 13:32:49 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXt: add CPE variables
Message-ID: <20210515111141.995AB81488@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0d0fec9a8db84077d1d2f2bfbb94237f54f5716
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:x:libxt is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax%3Alibxt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
 
