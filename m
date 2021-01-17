From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 17:08:50 +0100
Subject: [Buildroot] [git commit] package/asn1c: set ASN1C_CPE_ID_VALID
Message-ID: <20210117155738.CD553815E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56e9aa463ca817aceb5b39816d00436400ce96dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:asn1c_project:asn1c is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aasn1c_project%3Aasn1c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
