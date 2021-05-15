From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 May 2021 10:34:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/libxcb: add
 LIBXCB_CPE_ID_VENDOR
Message-ID: <20210515083453.2362388-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:x:libxcb is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax%3Alibxcb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/libxcb/libxcb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index 9a35a72995..4cbd9cf62f 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -9,6 +9,7 @@ LIBXCB_SOURCE = libxcb-$(LIBXCB_VERSION).tar.xz
 LIBXCB_SITE = http://xcb.freedesktop.org/dist
 LIBXCB_LICENSE = MIT
 LIBXCB_LICENSE_FILES = COPYING
+LIBXCB_CPE_ID_VENDOR = x
 
 LIBXCB_INSTALL_STAGING = YES
 
-- 
2.30.2
