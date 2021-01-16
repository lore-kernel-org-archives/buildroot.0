From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 21:55:33 +0100
Subject: [Buildroot] [git commit] package/wolfssl: add WOLFSSL_CPE_ID_VENDOR
Message-ID: <20210116203845.80AB887A38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=964824ec8164f0235e1e010b590c971e5e5ac50b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:wolfssl:wolfssl is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awolfssl%3Awolfssl

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
