From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Mar 2021 21:37:43 +0100
Subject: [Buildroot] [git commit] package/jpeg-turbo: add CPE variables
Message-ID: <20210302201929.CF60886B2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0feed4e472e5020606bd280d8b5609883be42f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libjpeg-turbo:libjpeg-turbo is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibjpeg-turbo%3Alibjpeg-turbo

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/jpeg-turbo/jpeg-turbo.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index cd12756618..5c977dc029 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -9,6 +9,8 @@ JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
 JPEG_TURBO_LICENSE_FILES = LICENSE.md README.ijg
+JPEG_TURBO_CPE_ID_VENDOR = libjpeg-turbo
+JPEG_TURBO_CPE_ID_PRODUCT = libjpeg-turbo
 JPEG_TURBO_INSTALL_STAGING = YES
 JPEG_TURBO_PROVIDES = jpeg
 JPEG_TURBO_DEPENDENCIES = host-pkgconf
