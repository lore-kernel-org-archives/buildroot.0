From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 13:47:44 +0200
Subject: [Buildroot] [git commit] package/jquery-validation: add CPE
 variables
Message-ID: <20210516111917.7D86F86D84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5ff2a28285e8d003466d5f00be058130a02bbf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:jqueryvalidation:jquery_validation is a valid CPE identifier
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ajqueryvalidation%3Ajquery_validation

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/jquery-validation/jquery-validation.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/jquery-validation/jquery-validation.mk b/package/jquery-validation/jquery-validation.mk
index a8c2897983..43e57a9fc9 100644
--- a/package/jquery-validation/jquery-validation.mk
+++ b/package/jquery-validation/jquery-validation.mk
@@ -9,6 +9,8 @@ JQUERY_VALIDATION_SITE = http://jqueryvalidation.org/files
 JQUERY_VALIDATION_SOURCE = jquery-validation-$(JQUERY_VALIDATION_VERSION).zip
 JQUERY_VALIDATION_LICENSE = MIT
 JQUERY_VALIDATION_LICENSE_FILES = README.md
+JQUERY_VALIDATION_CPE_ID_VENDOR = jqueryvalidation
+JQUERY_VALIDATION_CPE_ID_PRODUCT = jquery_validation
 
 define JQUERY_VALIDATION_EXTRACT_CMDS
 	$(UNZIP) -d $(@D) $(JQUERY_VALIDATION_DL_DIR)/$(JQUERY_VALIDATION_SOURCE)
