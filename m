From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 16:45:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/jasper: set JASPER_CPE_ID_VALID
Message-ID: <20210117154504.349610-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:jasper_project:jasper is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ajasper_project%3Ajasper

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jasper/jasper.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index bb50168d67..d8110082c9 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -9,6 +9,7 @@ JASPER_SITE = $(call github,jasper-software,jasper,version-$(JASPER_VERSION))
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer-2.0
 JASPER_LICENSE_FILES = LICENSE
+JASPER_CPE_ID_VALID = YES
 JASPER_SUPPORTS_IN_SOURCE_BUILD = NO
 JASPER_CONF_OPTS = \
 	-DCMAKE_DISABLE_FIND_PACKAGE_DOXYGEN=TRUE \
-- 
2.29.2
