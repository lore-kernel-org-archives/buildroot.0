From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 Feb 2021 08:28:57 +0100
Subject: [Buildroot] [git commit] package/libraw: add LIBRAW_CPE_ID_VENDOR
Message-ID: <20210208071901.2A09181332@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8a8fefbe7e5a2cad5f3dbba4da86c782bedc437
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libraw:libraw is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibraw%3Alibraw

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libraw/libraw.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index 7f79000fd3..fc02c7915f 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -13,6 +13,7 @@ LIBRAW_CONF_OPTS += \
 	--disable-openmp
 LIBRAW_LICENSE = LGPL-2.1 or CDDL-1.0
 LIBRAW_LICENSE_FILES = LICENSE.LGPL LICENSE.CDDL README.md
+LIBRAW_CPE_ID_VENDOR = libraw
 LIBRAW_DEPENDENCIES = host-pkgconf
 # https://github.com/LibRaw/LibRaw/issues/353
 LIBRAW_AUTORECONF = YES
