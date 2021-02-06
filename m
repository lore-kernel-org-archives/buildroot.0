From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Feb 2021 12:22:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/p11-kit: set P11_KIT_CPE_ID_VALID
Message-ID: <20210206112244.2002144-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:p11-kit_project:p11-kit is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ap11-kit_project%3Ap11-kit

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/p11-kit/p11-kit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 81972f811b..977150f571 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -13,6 +13,7 @@ P11_KIT_CONF_ENV = ac_cv_have_decl_program_invocation_short_name=yes \
 	ac_cv_have_decl___progname=no
 P11_KIT_LICENSE = BSD-3-Clause
 P11_KIT_LICENSE_FILES = COPYING
+P11_KIT_CPE_ID_VALID = YES
 
 ifeq ($(BR2_PACKAGE_LIBFFI),y)
 P11_KIT_DEPENDENCIES += host-pkgconf libffi
-- 
2.29.2
