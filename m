From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 21 Mar 2021 10:27:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/gutenprint: add
 GUTENPRINT_CPE_ID_VENDOR
Message-ID: <20210321092706.533564-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gutenprint_project:gutenprint is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agutenprint_project%3Agutenprint

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gutenprint/gutenprint.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index 9cb80c3e95..b0fcd5a598 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -10,6 +10,7 @@ GUTENPRINT_SITE = http://downloads.sourceforge.net/project/gimp-print/gutenprint
 GUTENPRINT_SOURCE = gutenprint-$(GUTENPRINT_VERSION).tar.bz2
 GUTENPRINT_LICENSE = GPL-2.0+
 GUTENPRINT_LICENSE_FILES = COPYING
+GUTENPRINT_CPE_ID_VENDOR = gutenprint_project
 
 # Needed, as we touch Makefile.am
 GUTENPRINT_AUTORECONF = YES
-- 
2.30.1
