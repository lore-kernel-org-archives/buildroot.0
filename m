From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 24 Jan 2021 19:22:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcdio: add LIBCDIO_CPE_ID_VENDOR
Message-ID: <20210124182200.1042565-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnu:libcdio is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Alibcdio

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.29.2
