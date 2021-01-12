From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 12 Jan 2021 19:04:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/openldap: add OPENLDAP_CPE_ID_VENDOR
Message-ID: <20210112180448.10093-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:openldap:openldap is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopenldap%3Aopenldap

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openldap/openldap.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index e44c958c41..17128910e1 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -9,6 +9,7 @@ OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
 OPENLDAP_SITE = https://www.openldap.org/software/download/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License
 OPENLDAP_LICENSE_FILES = LICENSE
+OPENLDAP_CPE_ID_VENDOR = $(OPENLDAP_NAME)
 OPENLDAP_INSTALL_STAGING = YES
 OPENLDAP_DEPENDENCIES = host-pkgconf
 
-- 
2.29.2
