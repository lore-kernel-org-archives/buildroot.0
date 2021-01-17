From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 12:50:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/botan: set BOTAN_CPE_ID_VALID
Message-ID: <20210117115059.314090-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:botan_project:botan is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Abotan_project%3Abotan

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/botan/botan.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 0f251fc350..f809aa2e0d 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -9,6 +9,7 @@ BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
 BOTAN_LICENSE_FILES = license.txt
+BOTAN_CPE_ID_VALID = YES
 
 BOTAN_INSTALL_STAGING = YES
 
-- 
2.29.2
