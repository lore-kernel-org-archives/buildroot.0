From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 May 2021 22:25:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/pwgen: add PWGEN_CPE_ID_VENDOR
Message-ID: <20210522202522.283239-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:pwgen_project:pwgen is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apwgen_project%3Apwgen

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pwgen/pwgen.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pwgen/pwgen.mk b/package/pwgen/pwgen.mk
index ad9465b82c..89925bb300 100644
--- a/package/pwgen/pwgen.mk
+++ b/package/pwgen/pwgen.mk
@@ -8,6 +8,7 @@ PWGEN_VERSION = 2.08
 PWGEN_SITE = http://downloads.sourceforge.net/project/pwgen/pwgen/$(PWGEN_VERSION)
 PWGEN_LICENSE = GPL-2.0
 PWGEN_LICENSE_FILES = debian/copyright
+PWGEN_CPE_ID_VENDOR = pwgen_project
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.30.2
