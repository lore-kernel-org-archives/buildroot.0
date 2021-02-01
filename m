From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  1 Feb 2021 18:54:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/snort: add SNORT_CPE_ID_VENDOR
Message-ID: <20210201175414.984955-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:snort:snort is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asnort%3Asnort

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/snort/snort.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/snort/snort.mk b/package/snort/snort.mk
index c618b4a6af..412c69f838 100644
--- a/package/snort/snort.mk
+++ b/package/snort/snort.mk
@@ -8,6 +8,7 @@ SNORT_VERSION = 2.9.17
 SNORT_SITE = https://www.snort.org/downloads/snort
 SNORT_LICENSE = GPL-2.0
 SNORT_LICENSE_FILES = LICENSE COPYING
+SNORT_CPE_ID_VENDOR = snort
 
 SNORT_DEPENDENCIES = libpcap libdnet daq pcre zlib host-pkgconf
 
-- 
2.29.2
