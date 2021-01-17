From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 16:19:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/asn1c: set ASN1C_CPE_ID_VALID
Message-ID: <20210117151904.347550-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:asn1c_project:asn1c is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aasn1c_project%3Aasn1c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/asn1c/asn1c.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/asn1c/asn1c.mk b/package/asn1c/asn1c.mk
index 314462a92b..e76a9f84fd 100644
--- a/package/asn1c/asn1c.mk
+++ b/package/asn1c/asn1c.mk
@@ -8,5 +8,6 @@ ASN1C_VERSION = 0.9.28
 ASN1C_SITE = https://github.com/vlm/asn1c/releases/download/v$(ASN1C_VERSION)
 ASN1C_LICENSE = BSD-2-Clause
 ASN1C_LICENSE_FILES = LICENSE
+ASN1C_CPE_ID_VALID = YES
 
 $(eval $(host-autotools-package))
-- 
2.29.2
