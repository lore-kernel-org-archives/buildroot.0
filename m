From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  9 Feb 2021 21:58:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/matio: set MATIO_CPE_ID_VALID
Message-ID: <20210209205845.1228858-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:matio_project:matio is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amatio_project%3Amatio

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/matio/matio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/matio/matio.mk b/package/matio/matio.mk
index 230dbf2374..eb83632746 100644
--- a/package/matio/matio.mk
+++ b/package/matio/matio.mk
@@ -8,6 +8,7 @@ MATIO_VERSION = 1.5.18
 MATIO_SITE = http://downloads.sourceforge.net/project/matio/matio/$(MATIO_VERSION)
 MATIO_LICENSE = BSD-2-Clause
 MATIO_LICENSE_FILES = COPYING
+MATIO_CPE_ID_VALID = YES
 MATIO_DEPENDENCIES = zlib
 MATIO_INSTALL_STAGING = YES
 
-- 
2.29.2
