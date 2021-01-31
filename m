From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 21:26:53 +0100
Subject: [Buildroot] [git commit] package/leptonica: add
 LEPTONICA_CPE_ID_VENDOR
Message-ID: <20210131200647.5AF1681537@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dce35d8f7111ad480be663a94ffe15e9b1994955
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:leptonica:leptonica is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aleptonica%3Aleptonica

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/leptonica/leptonica.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
index 2fe55023cc..93d1e47c28 100644
--- a/package/leptonica/leptonica.mk
+++ b/package/leptonica/leptonica.mk
@@ -8,6 +8,7 @@ LEPTONICA_VERSION = 1.80.0
 LEPTONICA_SITE = http://www.leptonica.org/source
 LEPTONICA_LICENSE = BSD-2-Clause
 LEPTONICA_LICENSE_FILES = leptonica-license.txt
+LEPTONICA_CPE_ID_VENDOR = leptonica
 LEPTONICA_INSTALL_STAGING = YES
 LEPTONICA_DEPENDENCIES = host-pkgconf
 
