From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  9 Feb 2021 21:27:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/freerdp: add FREERDP_CPE_ID_VENDOR
Message-ID: <20210209202719.1221322-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:freerdp:freerdp is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afreerdp%3Afreerdp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freerdp/freerdp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 4c804c136f..16d58b5aa0 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -9,6 +9,7 @@ FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
+FREERDP_CPE_ID_VENDOR = freerdp
 
 FREERDP_INSTALL_STAGING = YES
 
-- 
2.29.2
