From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  9 Feb 2021 21:48:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/nghttp2: add NGHTTP2_CPE_ID_VENDOR
Message-ID: <20210209204827.1228179-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:nghttp2:nghttp2 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anghttp2%3Anghttp2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nghttp2/nghttp2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
index 7b611c88fd..9190fa30d6 100644
--- a/package/nghttp2/nghttp2.mk
+++ b/package/nghttp2/nghttp2.mk
@@ -9,6 +9,7 @@ NGHTTP2_SITE = https://github.com/nghttp2/nghttp2/releases/download/v$(NGHTTP2_V
 NGHTTP2_LICENSE = MIT
 NGHTTP2_LICENSE_FILES = COPYING
 NGHTTP2_INSTALL_STAGING = YES
+NGHTTP2_CPE_ID_VENDOR = nghttp2
 NGHTTP2_DEPENDENCIES = host-pkgconf
 NGHTTP2_CONF_OPTS = --enable-lib-only
 
-- 
2.29.2
