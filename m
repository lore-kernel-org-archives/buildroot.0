From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 14 May 2021 23:51:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXdmcp: add CPE
 variables
Message-ID: <20210514215132.2275553-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:x.org:libxdmcp is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax.org%3Alibxdmcp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index 1182903e87..51db9908e5 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -9,6 +9,8 @@ XLIB_LIBXDMCP_SOURCE = libXdmcp-$(XLIB_LIBXDMCP_VERSION).tar.bz2
 XLIB_LIBXDMCP_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXDMCP_LICENSE = MIT
 XLIB_LIBXDMCP_LICENSE_FILES = COPYING
+XLIB_LIBXDMCP_CPE_ID_VENDOR = x.org
+XLIB_LIBXDMCP_CPE_ID_PRODUCT = libxdmcp
 XLIB_LIBXDMCP_INSTALL_STAGING = YES
 XLIB_LIBXDMCP_DEPENDENCIES = xutil_util-macros xorgproto host-pkgconf
 HOST_XLIB_LIBXDMCP_DEPENDENCIES = host-xutil_util-macros host-xorgproto host-pkgconf
-- 
2.30.2
