From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Feb 2021 14:13:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libX11: add CPE variables
Message-ID: <20210207131302.2936881-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:x.org:libx11 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax.org%3Alibx11

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xlib_libX11/xlib_libX11.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index f36b5e6ffa..8fefbc492a 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -9,6 +9,8 @@ XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
 XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
 XLIB_LIBX11_LICENSE_FILES = COPYING
+XLIB_LIBX11_CPE_ID_VENDOR = x.org
+XLIB_LIBX11_CPE_ID_PRODUCT = libx11
 XLIB_LIBX11_INSTALL_STAGING = YES
 XLIB_LIBX11_DEPENDENCIES = \
 	libxcb \
-- 
2.29.2
