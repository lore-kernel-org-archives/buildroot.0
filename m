From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  3 Mar 2021 10:30:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/elfutils: set ELFUTILS_CPE_ID_VALID
Message-ID: <20210303093044.469295-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:elfutils_project:elfutils is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aelfutils_project%3Aelfutils

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/elfutils/elfutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 42f2f8b304..e52e38b16e 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -10,6 +10,7 @@ ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES
 ELFUTILS_LICENSE = GPL-2.0+ or LGPL-3.0+ (library)
 ELFUTILS_LICENSE_FILES = COPYING COPYING-GPLV2 COPYING-LGPLV3
+ELFUTILS_CPE_ID_VALID = YES
 ELFUTILS_DEPENDENCIES = host-pkgconf zlib $(TARGET_NLS_DEPENDENCIES)
 HOST_ELFUTILS_DEPENDENCIES = host-pkgconf host-zlib host-bzip2 host-xz
 
-- 
2.30.0
