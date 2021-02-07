From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Feb 2021 14:03:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/gnupg: add CPE variables
Message-ID: <20210207130328.2907000-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnupg:gnupg is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnupg%3Agnupg

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnupg2/gnupg2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 0cbb99629b..2f62890db6 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -9,6 +9,8 @@ GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
 GNUPG2_LICENSE_FILES = COPYING
+GNUPG2_CPE_ID_VENDOR = gnupg
+GNUPG2_CPE_ID_PRODUCT = gnupg
 GNUPG2_DEPENDENCIES = zlib libgpg-error libgcrypt libassuan libksba libnpth \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) host-pkgconf
 
-- 
2.29.2
