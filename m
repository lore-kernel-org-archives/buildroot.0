From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 12:45:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/zip: add ZIP_CPE_ID_VENDOR
Message-ID: <20210117114519.313452-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:info-zip_project:zip is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ainfo-zip_project%3Azip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zip/zip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zip/zip.mk b/package/zip/zip.mk
index c78efedc25..2d11e1c763 100644
--- a/package/zip/zip.mk
+++ b/package/zip/zip.mk
@@ -10,6 +10,7 @@ ZIP_SOURCE = zip$(subst .,,$(ZIP_VERSION)).tgz
 ZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
 ZIP_LICENSE = Info-ZIP
 ZIP_LICENSE_FILES = LICENSE
+ZIP_CPE_ID_VENDOR = info-zip_project
 ZIP_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
-- 
2.29.2
