From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 May 2021 13:32:46 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXcursor: add CPE
 variables
Message-ID: <20210515111141.754CF81251@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3a25a98d460cafe4a95d3e5842918b2f7c7f746
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:x:libxcursor is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax%3Alibxcursor

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index 9bbd460c9d..79d9904010 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
@@ -10,6 +10,8 @@ XLIB_LIBXCURSOR_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXCURSOR_LICENSE = MIT
 XLIB_LIBXCURSOR_LICENSE_FILES = COPYING
 XLIB_LIBXCURSOR_INSTALL_STAGING = YES
+XLIB_LIBXCURSOR_CPE_ID_VENDOR = x
+XLIB_LIBXCURSOR_CPE_ID_PRODUCT = libxcursor
 XLIB_LIBXCURSOR_DEPENDENCIES = xlib_libX11 xlib_libXfixes xlib_libXrender xorgproto
 HOST_XLIB_LIBXCURSOR_DEPENDENCIES = \
 	host-xlib_libX11 host-xlib_libXfixes host-xlib_libXrender \
