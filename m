From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 May 2021 17:35:43 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/qpdf: add
 QPDF_CPE_ID_VENDOR
Message-ID: <20210519150758.2BAD587A43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83225c36a02b164433eb350d9dad014da4468ad9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:qpdf_project:qpdf is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aqpdf_project%3Aqpdf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2774a21025c8beb89639f8a4643d01f3d363ff32)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qpdf/qpdf.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index fd31140b0c..ec3d3f89a3 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -9,6 +9,7 @@ QPDF_SITE = http://downloads.sourceforge.net/project/qpdf/qpdf/$(QPDF_VERSION)
 QPDF_INSTALL_STAGING = YES
 QPDF_LICENSE = Apache-2.0 or Artistic-2.0
 QPDF_LICENSE_FILES = LICENSE.txt Artistic-2.0
+QPDF_CPE_ID_VENDOR = qpdf_project
 QPDF_DEPENDENCIES = host-pkgconf zlib jpeg
 
 QPDF_CONF_OPTS = --with-random=/dev/urandom
