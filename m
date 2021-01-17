From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jan 2021 14:53:22 +0100
Subject: [Buildroot] [git commit] package/midori: add MIDORI_CPE_ID_VENDOR
Message-ID: <20210117133636.E5356815C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c68373fccb92154b90a0e06714610d2f66fa542
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:midori-browser:midori is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amidori-browser%3Amidori

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/midori/midori.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 1755f1241a..eebec815c0 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -9,6 +9,7 @@ MIDORI_SOURCE = midori_$(MIDORI_VERSION)_all_.tar.bz2
 MIDORI_SITE = http://midori-browser.org/downloads
 MIDORI_LICENSE = LGPL-2.1+
 MIDORI_LICENSE_FILES = COPYING
+MIDORI_CPE_ID_VENDOR = midori-browser
 MIDORI_DEPENDENCIES = \
 	host-intltool \
 	host-librsvg \
