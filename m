From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Mar 2021 13:57:17 +0100
Subject: [Buildroot] [git commit] package/libpng: set LIBPNG_CPE_ID_VENDOR
Message-ID: <20210305123919.ADA4387409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e5c0eae2bbd0686d09c52b4b8c8be521a62de55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libpng:libpng is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibpng%3Alibpng

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpng/libpng.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 1a83c7e712..e4e629bbb5 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -10,6 +10,7 @@ LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
 LIBPNG_LICENSE = Libpng-2.0
 LIBPNG_LICENSE_FILES = LICENSE
+LIBPNG_CPE_ID_VENDOR = libpng
 LIBPNG_INSTALL_STAGING = YES
 LIBPNG_DEPENDENCIES = host-pkgconf zlib
 HOST_LIBPNG_DEPENDENCIES = host-pkgconf host-zlib
