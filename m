From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Feb 2021 17:58:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/oniguruma: set
 ONIGURUMA_CPE_ID_VALID
Message-ID: <20210206165807.2008353-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:oniguruma_project:oniguruma is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aoniguruma_project%3Aoniguruma

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/oniguruma/oniguruma.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/oniguruma/oniguruma.mk b/package/oniguruma/oniguruma.mk
index e7aaa43c2f..ef63a5e8a7 100644
--- a/package/oniguruma/oniguruma.mk
+++ b/package/oniguruma/oniguruma.mk
@@ -10,6 +10,7 @@ ONIGURUMA_SITE = \
 ONIGURUMA_SOURCE = onig-$(ONIGURUMA_VERSION).tar.gz
 ONIGURUMA_LICENSE = BSD-2-Clause
 ONIGURUMA_LICENSE_FILES = COPYING
+ONIGURUMA_CPE_ID_VALID = YES
 ONIGURUMA_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
2.29.2
