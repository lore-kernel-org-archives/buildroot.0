From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 17:08:53 +0100
Subject: [Buildroot] [git commit] package/jasper: set JASPER_CPE_ID_VALID
Message-ID: <20210117155738.E703487590@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=691e4e9c09dca280e31033f0661a9285f31b8f74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:jasper_project:jasper is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ajasper_project%3Ajasper

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/jasper/jasper.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index bb50168d67..d8110082c9 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -9,6 +9,7 @@ JASPER_SITE = $(call github,jasper-software,jasper,version-$(JASPER_VERSION))
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer-2.0
 JASPER_LICENSE_FILES = LICENSE
+JASPER_CPE_ID_VALID = YES
 JASPER_SUPPORTS_IN_SOURCE_BUILD = NO
 JASPER_CONF_OPTS = \
 	-DCMAKE_DISABLE_FIND_PACKAGE_DOXYGEN=TRUE \
