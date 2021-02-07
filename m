From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Feb 2021 14:52:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXvMC: add CPE
 variables
Message-ID: <20210207135226.2944158-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:x.org:libxvmc is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax.org%3Alibxvmc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
index 02959c2305..7980f17493 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
@@ -9,6 +9,8 @@ XLIB_LIBXVMC_SOURCE = libXvMC-$(XLIB_LIBXVMC_VERSION).tar.bz2
 XLIB_LIBXVMC_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXVMC_LICENSE = MIT
 XLIB_LIBXVMC_LICENSE_FILES = COPYING
+XLIB_LIBXVMC_CPE_ID_VENDOR = x.org
+XLIB_LIBXVMC_CPE_ID_PRODUCT = libxvmc
 XLIB_LIBXVMC_INSTALL_STAGING = YES
 XLIB_LIBXVMC_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXv xorgproto
 XLIB_LIBXVMC_CONF_OPTS = --disable-malloc0returnsnull
-- 
2.29.2
