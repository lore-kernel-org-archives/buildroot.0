From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  9 Feb 2021 21:42:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/tinydtls: add TINYDTLS_CPE_ID_VENDOR
Message-ID: <20210209204236.1227518-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:eclipse:tinydtls is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aeclipse%3Atinydtls

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tinydtls/tinydtls.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tinydtls/tinydtls.mk b/package/tinydtls/tinydtls.mk
index b4fd06ff70..6d839bc05a 100644
--- a/package/tinydtls/tinydtls.mk
+++ b/package/tinydtls/tinydtls.mk
@@ -8,6 +8,7 @@ TINYDTLS_VERSION = 0.9-rc1
 TINYDTLS_SITE = $(call github,eclipse,tinydtls,v$(TINYDTLS_VERSION))
 TINYDTLS_LICENSE = EPL-1.0 or EDL-1.0
 TINYDTLS_LICENSE_FILES = LICENSE
+TINYDTLS_CPE_ID_VENDOR = eclipse
 TINYDTLS_INSTALL_STAGING = YES
 TINYDTLS_DEPENDENCIES = host-pkgconf
 # From git
-- 
2.29.2
