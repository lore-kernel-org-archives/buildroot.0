From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 21:49:06 +0100
Subject: [Buildroot] [git commit] package/exiv2: add EXIV2_CPE_ID_VENDOR
Message-ID: <20210118203943.738CB88530@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3df70b5fee40c756cc158a0bbdd13e0c75c63bbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:exiv2:exiv2 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aexiv2%3Aexiv2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/exiv2/exiv2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index 78b9c2e425..a898159a70 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -9,6 +9,7 @@ EXIV2_SITE = $(call github,Exiv2,exiv2,v$(EXIV2_VERSION))
 EXIV2_INSTALL_STAGING = YES
 EXIV2_LICENSE = GPL-2.0+
 EXIV2_LICENSE_FILES = COPYING
+EXIV2_CPE_ID_VENDOR = exiv2
 
 EXIV2_CONF_OPTS += -DEXIV2_BUILD_SAMPLES=OFF
 
