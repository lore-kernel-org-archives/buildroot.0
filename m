From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  4 Feb 2021 20:00:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/libksba: set LIBKSBA_CPE_ID_VALID
Message-ID: <20210204190006.1270069-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libksba_project:libksba is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibksba_project%3Alibksba

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libksba/libksba.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index b2f4db6b62..2ad9bee06d 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -9,6 +9,7 @@ LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = ftp://ftp.gnupg.org/gcrypt/libksba
 LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
 LIBKSBA_LICENSE_FILES = AUTHORS COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv3
+LIBKSBA_CPE_ID_VALID = YES
 LIBKSBA_INSTALL_STAGING = YES
 LIBKSBA_DEPENDENCIES = libgpg-error
 LIBKSBA_CONF_OPTS = --with-gpg-error-prefix=$(STAGING_DIR)/usr
-- 
2.29.2
