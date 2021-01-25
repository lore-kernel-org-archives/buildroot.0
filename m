From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 21:26:57 +0100
Subject: [Buildroot] [git commit] package/libcdio: add LIBCDIO_CPE_ID_VENDOR
Message-ID: <20210125201144.967B983844@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fdce2261f75b697218a6d9f2a43b75ff0909f85f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:gnu:libcdio is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Alibcdio

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcdio/libcdio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcdio/libcdio.mk b/package/libcdio/libcdio.mk
index 4bf55d3344..df26d9a7ac 100644
--- a/package/libcdio/libcdio.mk
+++ b/package/libcdio/libcdio.mk
@@ -10,6 +10,7 @@ LIBCDIO_SITE = $(BR2_GNU_MIRROR)/libcdio
 LIBCDIO_INSTALL_STAGING = YES
 LIBCDIO_LICENSE = GPL-3.0+
 LIBCDIO_LICENSE_FILES = COPYING
+LIBCDIO_CPE_ID_VENDOR = gnu
 LIBCDIO_CONF_OPTS = --disable-example-progs --disable-cddb
 
 ifeq ($(BR2_ENABLE_LOCALE),)
