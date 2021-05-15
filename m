From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 May 2021 13:32:52 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXpm: add CPE
 variables
Message-ID: <20210515111141.D1E4F81488@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da67bf6418d4d1341b5bb731e06fbe72b2140a1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libxpm_project:libxpm is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibxpm_project%3Alibxpm

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXpm/xlib_libXpm.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 455fb10bf2..7b645dc9e6 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -9,6 +9,8 @@ XLIB_LIBXPM_SOURCE = libXpm-$(XLIB_LIBXPM_VERSION).tar.bz2
 XLIB_LIBXPM_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXPM_LICENSE = MIT
 XLIB_LIBXPM_LICENSE_FILES = COPYING COPYRIGHT
+XLIB_LIBXPM_CPE_ID_VENDOR = libxpm_project
+XLIB_LIBXPM_CPE_ID_PRODUCT = libxpm
 XLIB_LIBXPM_INSTALL_STAGING = YES
 XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xorgproto \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
