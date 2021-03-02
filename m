From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Mar 2021 21:37:42 +0100
Subject: [Buildroot] [git commit] package/tiff: add CPE variables
Message-ID: <20210302201929.C08F581E4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fea76b1e90baafae881611d2e4907cd920eb9c45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libtiff:libtiff is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibtiff%3Alibtiff

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tiff/tiff.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 7568215f92..c3d8045144 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -8,6 +8,8 @@ TIFF_VERSION = 4.2.0
 TIFF_SITE = http://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
 TIFF_LICENSE_FILES = COPYRIGHT
+TIFF_CPE_ID_VENDOR = libtiff
+TIFF_CPE_ID_PRODUCT = libtiff
 TIFF_INSTALL_STAGING = YES
 TIFF_CONF_OPTS = \
 	--disable-cxx \
