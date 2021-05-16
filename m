From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 May 2021 12:17:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/terminology: add
 TERMINOLOGY_CPE_ID_VENDOR
Message-ID: <20210516101702.3770420-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:enlightenment:terminology is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aenlightenment%3Aterminology

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/terminology/terminology.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
index 9fac4d2775..c17a6b0771 100644
--- a/package/terminology/terminology.mk
+++ b/package/terminology/terminology.mk
@@ -9,6 +9,7 @@ TERMINOLOGY_SOURCE = terminology-$(TERMINOLOGY_VERSION).tar.xz
 TERMINOLOGY_SITE = https://download.enlightenment.org/rel/apps/terminology
 TERMINOLOGY_LICENSE = BSD-2-Clause
 TERMINOLOGY_LICENSE_FILES = COPYING
+TERMINOLOGY_CPE_ID_VENDOR = enlightenment
 
 TERMINOLOGY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) efl host-pkgconf
 TERMINOLOGY_CONF_OPTS = -Dedje-cc=$(HOST_DIR)/bin/edje_cc
-- 
2.30.2
