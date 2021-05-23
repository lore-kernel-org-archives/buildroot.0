From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 May 2021 12:43:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/p7zip: add P7ZIP_CPE_ID_VENDOR
Message-ID: <20210523104335.1519139-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:7-zip:p7zip is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3A7-zip%3Ap7zip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/p7zip/p7zip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/p7zip/p7zip.mk b/package/p7zip/p7zip.mk
index 59cd9b7e95..43fbe775dc 100644
--- a/package/p7zip/p7zip.mk
+++ b/package/p7zip/p7zip.mk
@@ -9,6 +9,7 @@ P7ZIP_SOURCE = p7zip_$(P7ZIP_VERSION)_src_all.tar.bz2
 P7ZIP_SITE = http://downloads.sourceforge.net/project/p7zip/p7zip/$(P7ZIP_VERSION)
 P7ZIP_LICENSE = LGPL-2.1+ with unRAR restriction
 P7ZIP_LICENSE_FILES = DOC/License.txt
+P7ZIP_CPE_ID_VENDOR = 7-zip
 
 # 0001-CVE-2016-9296.patch
 P7ZIP_IGNORE_CVES += CVE-2016-9296
-- 
2.30.2
