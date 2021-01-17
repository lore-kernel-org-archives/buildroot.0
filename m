From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jan 2021 14:53:27 +0100
Subject: [Buildroot] [git commit] package/botan: set BOTAN_CPE_ID_VALID
Message-ID: <20210117133641.5AB5D815C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4342a6142e92f525e14dfc26bc2063d8fe704796
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:botan_project:botan is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Abotan_project%3Abotan

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/botan/botan.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 0f251fc350..f809aa2e0d 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -9,6 +9,7 @@ BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
 BOTAN_LICENSE_FILES = license.txt
+BOTAN_CPE_ID_VALID = YES
 
 BOTAN_INSTALL_STAGING = YES
 
