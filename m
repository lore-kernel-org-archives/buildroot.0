From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 16:39:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/clamav: add CLAMAV_CPE_ID_VENDOR
Message-ID: <20210117153951.349212-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:clamav:clamav is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aclamav%3Aclamav

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/clamav/clamav.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 45d62943a0..1d90073084 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -10,6 +10,7 @@ CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
 	COPYING.LGPL COPYING.llvm COPYING.lzma COPYING.pcre COPYING.regex \
 	COPYING.unrar COPYING.zlib
+CLAMAV_CPE_ID_VENDOR = clamav
 CLAMAV_DEPENDENCIES = \
 	host-pkgconf \
 	libcurl \
-- 
2.29.2
