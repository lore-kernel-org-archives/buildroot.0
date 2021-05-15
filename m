From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 May 2021 13:32:40 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXfont2: add CPE
 variables
Message-ID: <20210515111141.0C63F81488@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68436b233505c032530dff1b3fe33c3aeac2a65e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:x:libxfont is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax%3Alibxfont

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXfont2/xlib_libXfont2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
index 611b8af548..d2ff4ca7f3 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
@@ -9,6 +9,8 @@ XLIB_LIBXFONT2_SOURCE = libXfont2-$(XLIB_LIBXFONT2_VERSION).tar.bz2
 XLIB_LIBXFONT2_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFONT2_LICENSE = MIT
 XLIB_LIBXFONT2_LICENSE_FILES = COPYING
+XLIB_LIBXFONT2_CPE_ID_VENDOR = x
+XLIB_LIBXFONT2_CPE_ID_PRODUCT = libxfont
 XLIB_LIBXFONT2_INSTALL_STAGING = YES
 # 0001-configure-define-HAVE_LIBBSD-when-libbsd-was-found.patch
 XLIB_LIBXFONT2_AUTORECONF = YES
