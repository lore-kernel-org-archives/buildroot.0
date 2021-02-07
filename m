From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Feb 2021 13:39:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/libraw: add LIBRAW_CPE_ID_VENDOR
Message-ID: <20210207123919.2637343-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libraw:libraw is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibraw%3Alibraw

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libraw/libraw.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index 7f79000fd3..fc02c7915f 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -13,6 +13,7 @@ LIBRAW_CONF_OPTS += \
 	--disable-openmp
 LIBRAW_LICENSE = LGPL-2.1 or CDDL-1.0
 LIBRAW_LICENSE_FILES = LICENSE.LGPL LICENSE.CDDL README.md
+LIBRAW_CPE_ID_VENDOR = libraw
 LIBRAW_DEPENDENCIES = host-pkgconf
 # https://github.com/LibRaw/LibRaw/issues/353
 LIBRAW_AUTORECONF = YES
-- 
2.29.2
