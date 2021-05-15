From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 May 2021 13:32:57 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libdmx: add CPE
 variables
Message-ID: <20210515111142.2B66481488@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2f0a2147a794681879b67c35d2979ac1b5a7378
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:x:libdmx is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax%3Alibdmx

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libdmx/xlib_libdmx.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libdmx/xlib_libdmx.mk b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
index c67593e9a4..429595b5d7 100644
--- a/package/x11r7/xlib_libdmx/xlib_libdmx.mk
+++ b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
@@ -9,6 +9,8 @@ XLIB_LIBDMX_SOURCE = libdmx-$(XLIB_LIBDMX_VERSION).tar.bz2
 XLIB_LIBDMX_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBDMX_LICENSE = MIT
 XLIB_LIBDMX_LICENSE_FILES = COPYING
+XLIB_LIBDMX_CPE_ID_VENDOR = x
+XLIB_LIBDMX_CPE_ID_PRODUCT = libdmx
 XLIB_LIBDMX_INSTALL_STAGING = YES
 XLIB_LIBDMX_DEPENDENCIES = xlib_libX11 xlib_libXext xorgproto
 XLIB_LIBDMX_CONF_OPTS = --disable-malloc0returnsnull
