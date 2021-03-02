From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  2 Mar 2021 14:31:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpam-tacplus: add CPE variables
Message-ID: <20210302133108.361534-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:pam_tacplus_project:pam_tacplus is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apam_tacplus_project%3Apam_tacplus

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpam-tacplus/libpam-tacplus.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libpam-tacplus/libpam-tacplus.mk b/package/libpam-tacplus/libpam-tacplus.mk
index b9630d8b37..ff0dce9c0b 100644
--- a/package/libpam-tacplus/libpam-tacplus.mk
+++ b/package/libpam-tacplus/libpam-tacplus.mk
@@ -8,6 +8,8 @@ LIBPAM_TACPLUS_VERSION = 1.6.1
 LIBPAM_TACPLUS_SITE = $(call github,jeroennijhof,pam_tacplus,v$(LIBPAM_TACPLUS_VERSION))
 LIBPAM_TACPLUS_LICENSE = GPL-2.0+
 LIBPAM_TACPLUS_LICENSE_FILES = COPYING
+LIBPAM_TACPLUS_CPE_ID_VENDOR = pam_tacplus_project
+LIBPAM_TACPLUS_CPE_ID_PRODUCT = pam_tacplus
 LIBPAM_TACPLUS_DEPENDENCIES = \
 	linux-pam \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl)
-- 
2.30.0
