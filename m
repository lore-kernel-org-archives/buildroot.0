From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 16:57:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/powerpc-utils: set
 POWERPC_UTILS_CPE_ID_VALID
Message-ID: <20210117155746.350654-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:powerpc-utils_project:powerpc-utils is a valid CPE identifier
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apowerpc-utils_project%3Apowerpc-utils

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/powerpc-utils/powerpc-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
index cd96435a78..2f8b7d3b96 100644
--- a/package/powerpc-utils/powerpc-utils.mk
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -10,6 +10,7 @@ POWERPC_UTILS_DEPENDENCIES = zlib
 POWERPC_UTILS_AUTORECONF = YES
 POWERPC_UTILS_LICENSE = GPL-2.0+
 POWERPC_UTILS_LICENSE_FILES = COPYING
+POWERPC_UTILS_CPE_ID_VALID = YES
 
 POWERPC_UTILS_CONF_ENV = \
 	ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
-- 
2.29.2
