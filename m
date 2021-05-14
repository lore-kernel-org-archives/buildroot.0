From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 14 May 2021 23:59:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXtst: add CPE
 variables
Message-ID: <20210514215920.2275968-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:x:libxtst is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax%3Alibxtst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xlib_libXtst/xlib_libXtst.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
index e0d7e8217c..c79301e064 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.mk
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
@@ -10,6 +10,8 @@ XLIB_LIBXTST_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXTST_LICENSE = MIT
 XLIB_LIBXTST_LICENSE_FILES = COPYING
 XLIB_LIBXTST_INSTALL_STAGING = YES
+XLIB_LIBXTST_CPE_ID_VENDOR = x
+XLIB_LIBXTST_CPE_ID_PRODUCT = libxtst
 
 XLIB_LIBXTST_DEPENDENCIES = \
 	xlib_libX11 \
-- 
2.30.2
