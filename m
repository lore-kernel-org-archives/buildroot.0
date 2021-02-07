From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Feb 2021 13:26:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/libass: set LIBASS_CPE_ID_VALID
Message-ID: <20210207122655.2465163-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libass_project:libass is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibass_project%3Alibass

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libass/libass.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index 818bff234e..8bdfd9dd40 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -12,6 +12,7 @@ LIBASS_SITE = https://github.com/libass/libass/releases/download/$(LIBASS_VERSIO
 LIBASS_INSTALL_STAGING = YES
 LIBASS_LICENSE = ISC
 LIBASS_LICENSE_FILES = COPYING
+LIBASS_CPE_ID_VALID = YES
 LIBASS_DEPENDENCIES = \
 	host-pkgconf \
 	freetype \
-- 
2.29.2
