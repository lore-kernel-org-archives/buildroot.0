From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 13:01:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/resiprocate: add
 RESIPROCATE_CPE_ID_VENDOR
Message-ID: <20210117120136.315172-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:resiprocate:resiprocate is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aresiprocate%3Aresiprocate

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/resiprocate/resiprocate.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/resiprocate/resiprocate.mk b/package/resiprocate/resiprocate.mk
index e4915eec59..b31712b41b 100644
--- a/package/resiprocate/resiprocate.mk
+++ b/package/resiprocate/resiprocate.mk
@@ -9,6 +9,7 @@ RESIPROCATE_SITE =  https://www.resiprocate.org/files/pub/reSIProcate/releases
 # For complete details see https://www.resiprocate.org/License
 RESIPROCATE_LICENSE = VSL-1.0, BSD-3-Clause
 RESIPROCATE_LICENSE_FILES = COPYING
+RESIPROCATE_CPE_ID_VENDOR = resiprocate
 RESIPROCATE_INSTALL_STAGING = YES
 
 # Utilize c-ares from buildroot instead built in ARES library
-- 
2.29.2
