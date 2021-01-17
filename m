From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 17:13:37 +0100
Subject: [Buildroot] [git commit] package/clamav: add CLAMAV_CPE_ID_VENDOR
Message-ID: <20210117155739.5410287590@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6f7e0a1cd895b1ac3093f7e778fde8b071a3210
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:clamav:clamav is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aclamav%3Aclamav

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/clamav/clamav.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 45d62943a0..1d90073084 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -10,6 +10,7 @@ CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
 	COPYING.LGPL COPYING.llvm COPYING.lzma COPYING.pcre COPYING.regex \
 	COPYING.unrar COPYING.zlib
+CLAMAV_CPE_ID_VENDOR = clamav
 CLAMAV_DEPENDENCIES = \
 	host-pkgconf \
 	libcurl \
