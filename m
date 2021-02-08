From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  8 Feb 2021 21:10:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/bison: add BISON_CPE_ID_VENDOR
Message-ID: <20210208201038.432906-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnu:bison is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Abison

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bison/bison.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 70111a8d62..efd75afd66 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -9,6 +9,7 @@ BISON_SOURCE = bison-$(BISON_VERSION).tar.xz
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 BISON_LICENSE = GPL-3.0+
 BISON_LICENSE_FILES = COPYING
+BISON_CPE_ID_VENDOR = gnu
 # parallel build issue in examples/c/reccalc/
 BISON_MAKE = $(MAKE1)
 HOST_BISON_DEPENDENCIES = host-m4
-- 
2.29.2
