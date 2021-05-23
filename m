From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 May 2021 12:39:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/libical: add LIBICAL_CPE_ID_VENDOR
Message-ID: <20210523103948.1518898-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libical_project:libical is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibical_project%3Alibical

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libical/libical.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libical/libical.mk b/package/libical/libical.mk
index f9a266026e..afbbfd98c8 100644
--- a/package/libical/libical.mk
+++ b/package/libical/libical.mk
@@ -9,6 +9,7 @@ LIBICAL_SITE = https://github.com/libical/libical/releases/download/v$(LIBICAL_V
 LIBICAL_INSTALL_STAGING = YES
 LIBICAL_LICENSE = MPL-1.0 or LGPL-2.1
 LIBICAL_LICENSE_FILES = LICENSE
+LIBICAL_CPE_ID_VENDOR = libical_project
 
 # 0002-icaltypes-c-icalreqstattype_from_string-copy-the-reqstattype.patch
 LIBICAL_IGNORE_CVES += CVE-2016-9584
-- 
2.30.2
