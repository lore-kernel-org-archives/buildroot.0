From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 23:18:03 +0200
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/x11r7/xlib_libXfont2: add CPE variables
Message-ID: <20210517210057.A998C87C0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db7de62da9c7609b9ad4a1d9d0d22c25b9accd0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:x:libxfont is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax%3Alibxfont

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 68436b233505c032530dff1b3fe33c3aeac2a65e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
