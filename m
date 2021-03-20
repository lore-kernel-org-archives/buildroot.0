From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 20 Mar 2021 19:21:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/cracklib: add CRACKLIB_CPE_ID_VENDOR
Message-ID: <20210320182102.444974-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:cracklib_project:cracklib is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Acracklib_project%3Acracklib

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cracklib/cracklib.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cracklib/cracklib.mk b/package/cracklib/cracklib.mk
index 91d510ff34..8e6a844f11 100644
--- a/package/cracklib/cracklib.mk
+++ b/package/cracklib/cracklib.mk
@@ -8,6 +8,7 @@ CRACKLIB_VERSION = 2.9.7
 CRACKLIB_SITE = https://github.com/cracklib/cracklib/releases/download/v$(CRACKLIB_VERSION)
 CRACKLIB_LICENSE = LGPL-2.1
 CRACKLIB_LICENSE_FILES = COPYING.LIB
+CRACKLIB_CPE_ID_VENDOR = cracklib_project
 CRACKLIB_INSTALL_STAGING = YES
 CRACKLIB_DEPENDENCIES = host-cracklib $(TARGET_NLS_DEPENDENCIES)
 CRACKLIB_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
-- 
2.30.1
