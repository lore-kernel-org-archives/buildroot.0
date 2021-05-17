From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 23:18:08 +0200
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/x11r7/xlib_libXinerama: add CPE variables
Message-ID: <20210517210057.B63A2875F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b4c01ddd70b313172a8080435359a93ac303a59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:x:libxinerama is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax%3Alibxinerama

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 713a76560b62ce092afd82e7199135dfc37b6650)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
index 405faefa46..48e32d55e2 100644
--- a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
+++ b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
@@ -9,6 +9,8 @@ XLIB_LIBXINERAMA_SOURCE = libXinerama-$(XLIB_LIBXINERAMA_VERSION).tar.bz2
 XLIB_LIBXINERAMA_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXINERAMA_LICENSE = MIT
 XLIB_LIBXINERAMA_LICENSE_FILES = COPYING
+XLIB_LIBXINERAMA_CPE_ID_VENDOR = x
+XLIB_LIBXINERAMA_CPE_ID_PRODUCT = libxinerama
 XLIB_LIBXINERAMA_INSTALL_STAGING = YES
 XLIB_LIBXINERAMA_DEPENDENCIES = xlib_libX11 xlib_libXext xorgproto
 XLIB_LIBXINERAMA_CONF_OPTS = --disable-malloc0returnsnull
