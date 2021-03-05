From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  5 Mar 2021 10:53:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/lzo: set LZO_CPE_ID_VALID
Message-ID: <20210305095304.1833557-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:lzo_project:lzo is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alzo_project%3Alzo

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lzo/lzo.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index 0ead92725a..76c00615d5 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -8,6 +8,7 @@ LZO_VERSION = 2.10
 LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
 LZO_LICENSE = GPL-2.0+
 LZO_LICENSE_FILES = COPYING
+LZO_CPE_ID_VALID = YES
 LZO_INSTALL_STAGING = YES
 LZO_SUPPORTS_IN_SOURCE_BUILD = NO
 
-- 
2.30.0
