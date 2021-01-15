From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 15 Jan 2021 09:03:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/json-c: set JSON_C_CPE_ID_VALID
Message-ID: <20210115080336.2077677-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:json-c_project:json-c is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ajson-c_project%3Ajson-c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/json-c/json-c.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 5e27c9b23b..a55831432a 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -9,6 +9,7 @@ JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases
 JSON_C_INSTALL_STAGING = YES
 JSON_C_LICENSE = MIT
 JSON_C_LICENSE_FILES = COPYING
+JSON_C_CPE_ID_VALID = YES
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.29.2
