From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 13:17:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/graphite2: add
 GRAPHITE2_CPE_ID_VENDOR
Message-ID: <20210117121711.316373-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:sil:graphite2 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asil%3Agraphite2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/graphite2/graphite2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/graphite2/graphite2.mk b/package/graphite2/graphite2.mk
index 40206bf0f8..7f9e3c516e 100644
--- a/package/graphite2/graphite2.mk
+++ b/package/graphite2/graphite2.mk
@@ -11,6 +11,7 @@ GRAPHITE2_SITE = \
 GRAPHITE2_INSTALL_STAGING = YES
 GRAPHITE2_LICENSE = LGPL-2.1+
 GRAPHITE2_LICENSE_FILES = LICENSE
+GRAPHITE2_CPE_ID_VENDOR = sil
 
 # Avoid building docs and tests to save time
 define GRAPHITE2_DISABLE_TESTS_DOC
-- 
2.29.2
