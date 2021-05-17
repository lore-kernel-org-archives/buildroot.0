From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 23:21:02 +0200
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/x11r7/xlib_libICE: add CPE variables
Message-ID: <20210517210058.1BDA287C0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49e83f6e100b7b90f0fd60a130d2abcc6a0642eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:freedesktop:libice is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afreedesktop%3Alibice

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3b4980677b3aa89656d4a26644cb58e81a79865d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libICE/xlib_libICE.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libICE/xlib_libICE.mk b/package/x11r7/xlib_libICE/xlib_libICE.mk
index 0b1f8ade17..2b56aaab98 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.mk
+++ b/package/x11r7/xlib_libICE/xlib_libICE.mk
@@ -9,6 +9,8 @@ XLIB_LIBICE_SOURCE = libICE-$(XLIB_LIBICE_VERSION).tar.bz2
 XLIB_LIBICE_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBICE_LICENSE = MIT
 XLIB_LIBICE_LICENSE_FILES = COPYING
+XLIB_LIBICE_CPE_ID_VENDOR = freedesktop
+XLIB_LIBICE_CPE_ID_PRODUCT = libice
 XLIB_LIBICE_INSTALL_STAGING = YES
 XLIB_LIBICE_DEPENDENCIES = xlib_xtrans xorgproto host-pkgconf
 
