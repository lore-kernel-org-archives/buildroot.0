From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 May 2021 13:32:56 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXxf86vm: add CPE
 variables
Message-ID: <20210515111142.1980883B57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ec75d777ec0018a1680047db0e32fef7ce5bce3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:x:libxxf86vm is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax%3Alibxxf86vm

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
index 2106451c74..8871bd507e 100644
--- a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
+++ b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
@@ -9,6 +9,8 @@ XLIB_LIBXXF86VM_SOURCE = libXxf86vm-$(XLIB_LIBXXF86VM_VERSION).tar.bz2
 XLIB_LIBXXF86VM_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXXF86VM_LICENSE = MIT
 XLIB_LIBXXF86VM_LICENSE_FILES = COPYING
+XLIB_LIBXXF86VM_CPE_ID_VENDOR = x
+XLIB_LIBXXF86VM_CPE_ID_PRODUCT = libxxf86vm
 XLIB_LIBXXF86VM_INSTALL_STAGING = YES
 XLIB_LIBXXF86VM_DEPENDENCIES = xlib_libX11 xlib_libXext xorgproto
 XLIB_LIBXXF86VM_CONF_OPTS = --disable-malloc0returnsnull
