From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  8 Feb 2021 21:09:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/attr: set ATTR_CPE_ID_VALID
Message-ID: <20210208200924.397764-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:attr_project:attr is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aattr_project%3Aattr

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/attr/attr.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index ba77e802d2..13f3f0db3d 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -8,6 +8,7 @@ ATTR_VERSION = 2.4.48
 ATTR_SITE = http://download.savannah.gnu.org/releases/attr
 ATTR_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 ATTR_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
+ATTR_CPE_ID_VALID = YES
 
 ATTR_INSTALL_STAGING = YES
 
-- 
2.29.2
