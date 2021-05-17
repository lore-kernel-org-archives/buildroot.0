From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 23:18:56 +0200
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/x11r7/xlib_libXext: add CPE variables
Message-ID: <20210517210057.D1898875F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d52d49b188a54009753b78d8975b3151ba7cba68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:x:libxext is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax%3Alibxext

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b1336915b6f72ebc489d2d7990c7d01bd3e0bd41)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXext/xlib_libXext.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libXext/xlib_libXext.mk b/package/x11r7/xlib_libXext/xlib_libXext.mk
index c63a3b23cc..6002e59e0d 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.mk
+++ b/package/x11r7/xlib_libXext/xlib_libXext.mk
@@ -9,6 +9,8 @@ XLIB_LIBXEXT_SOURCE = libXext-$(XLIB_LIBXEXT_VERSION).tar.bz2
 XLIB_LIBXEXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXEXT_LICENSE = MIT
 XLIB_LIBXEXT_LICENSE_FILES = COPYING
+XLIB_LIBXEXT_CPE_ID_VENDOR = x
+XLIB_LIBXEXT_CPE_ID_PRODUCT = libxext
 XLIB_LIBXEXT_INSTALL_STAGING = YES
 XLIB_LIBXEXT_DEPENDENCIES = xlib_libX11 xorgproto
 XLIB_LIBXEXT_CONF_OPTS = --disable-malloc0returnsnull
