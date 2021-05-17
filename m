From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 23:18:49 +0200
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/x11r7/xlib_libXfixes: add CPE variables
Message-ID: <20210517210057.C5C5B87C0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89d08aeba3306a8b51bff38177e1fdcc9d7eb944
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:x:libxfixes is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax%3Alibxfixes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 73ddf01dd813929f131e48dc9d7e50b412f88c25)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
index f563ba34ec..6674cccb64 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
@@ -9,6 +9,8 @@ XLIB_LIBXFIXES_SOURCE = libXfixes-$(XLIB_LIBXFIXES_VERSION).tar.bz2
 XLIB_LIBXFIXES_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFIXES_LICENSE = MIT
 XLIB_LIBXFIXES_LICENSE_FILES = COPYING
+XLIB_LIBXFIXES_CPE_ID_VENDOR = x
+XLIB_LIBXFIXES_CPE_ID_PRODUCT = libxfixes
 XLIB_LIBXFIXES_INSTALL_STAGING = YES
 XLIB_LIBXFIXES_DEPENDENCIES =  xlib_libX11 xorgproto
 HOST_XLIB_LIBXFIXES_DEPENDENCIES = \
