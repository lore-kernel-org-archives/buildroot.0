From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 15 Jan 2021 07:38:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: add WOLFSSL_CPE_ID_VENDOR
Message-ID: <20210115063842.2073031-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:wolfssl:wolfssl is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awolfssl%3Awolfssl

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wolfssl/wolfssl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 2023401147..d66a1c2800 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -10,6 +10,7 @@ WOLFSSL_INSTALL_STAGING = YES
 
 WOLFSSL_LICENSE = GPL-2.0+
 WOLFSSL_LICENSE_FILES = COPYING LICENSING
+WOLFSSL_CPE_ID_VENDOR = wolfssl
 
 WOLFSSL_DEPENDENCIES = host-pkgconf
 
-- 
2.29.2
