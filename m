From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 28 Jan 2021 23:15:06 +0100
Subject: [Buildroot] [PATCH 1/2] package/libgpgme: add CPE variables
Message-ID: <20210128221507.49685-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnupg:gpgme is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnupg%3Agpgme

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgpgme/libgpgme.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 1951cc6675..0e6f6906ed 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -9,6 +9,8 @@ LIBGPGME_SITE = https://gnupg.org/ftp/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPL-2.1+
 LIBGPGME_LICENSE_FILES = COPYING.LESSER
+LIBGPGME_CPE_ID_VENDOR = gnupg
+LIBGPGME_CPE_ID_PRODUCT = gpgpme
 LIBGPGME_INSTALL_STAGING = YES
 LIBGPGME_DEPENDENCIES = libassuan libgpg-error
 LIBGPGME_CONFIG_SCRIPTS = gpgme-config
-- 
2.29.2
