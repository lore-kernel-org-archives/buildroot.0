From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  4 Feb 2021 20:01:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/valijson: set VALIJSON_CPE_ID_VALID
Message-ID: <20210204190134.1270217-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:valijson_project:valijson is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Avalijson_project%3Avalijson

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/valijson/valijson.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
index b38c6319a6..29e6342a68 100644
--- a/package/valijson/valijson.mk
+++ b/package/valijson/valijson.mk
@@ -8,6 +8,7 @@ VALIJSON_VERSION = 0.3
 VALIJSON_SITE = $(call github,tristanpenman,valijson,v$(VALIJSON_VERSION))
 VALIJSON_LICENSE = BSD-2-Clause
 VALIJSON_LICENSE_FILES = LICENSE
+VALIJSON_CPE_ID_VALID = YES
 VALIJSON_INSTALL_STAGING = YES
 VALIJSON_INSTALL_TARGET = NO
 VALIJSON_DEPENDENCIES = boost
-- 
2.29.2
