From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Jan 2021 08:55:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/libebml: add LIBEBML_CPE_ID_VENDOR
Message-ID: <20210119075533.790565-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:matroska:libebml is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amatroska%3Alibebml

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libebml/libebml.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libebml/libebml.mk b/package/libebml/libebml.mk
index 911093f5ce..7ae31d3e22 100644
--- a/package/libebml/libebml.mk
+++ b/package/libebml/libebml.mk
@@ -10,5 +10,6 @@ LIBEBML_SITE = http://dl.matroska.org/downloads/libebml
 LIBEBML_INSTALL_STAGING = YES
 LIBEBML_LICENSE = LGPL-2.1+
 LIBEBML_LICENSE_FILES = LICENSE.LGPL
+LIBEBML_CPE_ID_VENDOR = matroska
 
 $(eval $(cmake-package))
-- 
2.29.2
