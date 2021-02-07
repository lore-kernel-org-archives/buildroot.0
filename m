From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Feb 2021 14:34:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXi: add CPE variables
Message-ID: <20210207133437.2942961-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:x.org:libxi is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax.org%3Alibxi

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xlib_libXi/xlib_libXi.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index de7f3a7d3c..ad4cf5f96f 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -9,6 +9,8 @@ XLIB_LIBXI_SOURCE = libXi-$(XLIB_LIBXI_VERSION).tar.bz2
 XLIB_LIBXI_SITE = https://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXI_LICENSE = MIT
 XLIB_LIBXI_LICENSE_FILES = COPYING
+XLIB_LIBXI_CPE_ID_VENDOR = x.org
+XLIB_LIBXI_CPE_ID_PRODUCT = libxi
 XLIB_LIBXI_INSTALL_STAGING = YES
 XLIB_LIBXI_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.29.2
