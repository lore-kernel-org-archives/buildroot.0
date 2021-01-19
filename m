From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Jan 2021 08:13:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/zziplib: set ZZIPLIB_CPE_ID_VALID
Message-ID: <20210119071302.787295-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:zziplib_project:zziplib is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Azziplib_project%3Azziplib

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zziplib/zziplib.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zziplib/zziplib.mk b/package/zziplib/zziplib.mk
index 6c2efe7558..6cb9dedce8 100644
--- a/package/zziplib/zziplib.mk
+++ b/package/zziplib/zziplib.mk
@@ -8,6 +8,7 @@ ZZIPLIB_VERSION = 0.13.72
 ZZIPLIB_SITE = $(call github,gdraheim,zziplib,v$(ZZIPLIB_VERSION))
 ZZIPLIB_LICENSE = LGPL-2.0+ or MPL-1.1
 ZZIPLIB_LICENSE_FILES = docs/COPYING.LIB docs/COPYING.MPL docs/copying.htm
+ZZIPLIB_CPE_ID_VALID = YES
 ZZIPLIB_INSTALL_STAGING = YES
 ZZIPLIB_CONF_OPTS += \
 	-DZZIPDOCS=OFF \
-- 
2.29.2
