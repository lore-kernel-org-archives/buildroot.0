From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 May 2021 16:19:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/minizip: add MINIZIP_CPE_ID_VENDOR
Message-ID: <20210523141925.1523106-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:minizip_project:minizip is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aminizip_project%3Aminizip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minizip/minizip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index 6bdc63a096..12d09c0ea6 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -14,6 +14,7 @@ MINIZIP_CONF_OPTS = \
 	-DMZ_FETCH_LIBS=OFF
 MINIZIP_LICENSE = Zlib
 MINIZIP_LICENSE_FILES = LICENSE
+MINZIP_CPE_ID_VENDOR = minizip_project
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 MINIZIP_DEPENDENCIES += bzip2
-- 
2.30.2
