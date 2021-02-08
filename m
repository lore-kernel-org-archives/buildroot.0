From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  8 Feb 2021 08:46:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXrandr: add CPE
 variables
Message-ID: <20210208074635.3858866-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:x.org:libxrandr is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax.org%3Alibxrandr

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
index 23a0d974d0..aa2761330a 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
@@ -9,6 +9,8 @@ XLIB_LIBXRANDR_SOURCE = libXrandr-$(XLIB_LIBXRANDR_VERSION).tar.bz2
 XLIB_LIBXRANDR_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRANDR_LICENSE = MIT
 XLIB_LIBXRANDR_LICENSE_FILES = COPYING
+XLIB_LIBXRANDR_CPE_ID_VENDOR = x.org
+XLIB_LIBXRANDR_CPE_ID_PRODUCT = libxrandr
 XLIB_LIBXRANDR_INSTALL_STAGING = YES
 XLIB_LIBXRANDR_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXrender xorgproto
 XLIB_LIBXRANDR_CONF_OPTS = --disable-malloc0returnsnull
-- 
2.29.2
