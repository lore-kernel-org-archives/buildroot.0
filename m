From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 16:22:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/dovecot: add DOVECOT_CPE_ID_VENDOR
Message-ID: <20210117152245.347806-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:dovecot:dovecot is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adovecot%3Adovecot

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dovecot/dovecot.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 3100bfbc93..8635ea5c4f 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -10,6 +10,7 @@ DOVECOT_SITE = https://dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
 DOVECOT_LICENSE_FILES = COPYING COPYING.LGPL COPYING.MIT
+DOVECOT_CPE_ID_VENDOR = dovecot
 DOVECOT_DEPENDENCIES = \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
-- 
2.29.2
