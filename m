From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  9 Feb 2021 21:39:12 +0100
Subject: [Buildroot] [PATCH 1/2] package/ngircd: add NGIRCD_CPE_ID_VENDOR
Message-ID: <20210209203913.1227258-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:barton:ngircd is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Abarton%3Angircd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ngircd/ngircd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index 4859a29c2f..ed15ded9d0 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -9,6 +9,7 @@ NGIRCD_SOURCE = ngircd-$(NGIRCD_VERSION).tar.xz
 NGIRCD_SITE = https://arthur.barton.de/pub/ngircd
 NGIRCD_LICENSE = GPL-2.0+
 NGIRCD_LICENSE_FILES = COPYING
+NGIRCD_CPE_ID_VENDOR = barton
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 NGIRCD_CONF_OPTS += --with-pam=$(STAGING_DIR)/usr
-- 
2.29.2
