From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Feb 2021 17:51:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/freetype: add FREETYPE_CPE_ID_VENDOR
Message-ID: <20210206165115.2007687-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:freetype:freetype is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afreetype%3Afreetype

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freetype/freetype.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index e543aee0b2..59d6dc0eb8 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -11,6 +11,7 @@ FREETYPE_INSTALL_STAGING = YES
 FREETYPE_MAKE_OPTS = CCexe="$(HOSTCC)"
 FREETYPE_LICENSE = Dual FTL/GPL-2.0+
 FREETYPE_LICENSE_FILES = docs/LICENSE.TXT docs/FTL.TXT docs/GPLv2.TXT
+FREETYPE_CPE_ID_VENDOR = freetype
 FREETYPE_DEPENDENCIES = host-pkgconf
 FREETYPE_CONFIG_SCRIPTS = freetype-config
 
-- 
2.29.2
