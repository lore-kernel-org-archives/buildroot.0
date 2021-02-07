From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Feb 2021 21:39:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/at-spi2-atk: add
 AT_SPI2_ATK_CPE_ID_VENDOR
Message-ID: <20210207203934.3155038-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnome:at-spi2-atk is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnome%3Aat-spi2-atk

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/at-spi2-atk/at-spi2-atk.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/at-spi2-atk/at-spi2-atk.mk b/package/at-spi2-atk/at-spi2-atk.mk
index 69d11f66bd..232b577230 100644
--- a/package/at-spi2-atk/at-spi2-atk.mk
+++ b/package/at-spi2-atk/at-spi2-atk.mk
@@ -11,6 +11,7 @@ AT_SPI2_ATK_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/at-spi2-atk/$(AT_SPI2_ATK_VERSION_MAJOR)
 AT_SPI2_ATK_LICENSE = LGPL-2.1+
 AT_SPI2_ATK_LICENSE_FILES = COPYING
+AT_SPI2_ATK_CPE_ID_VENDOR = gnome
 AT_SPI2_ATK_INSTALL_STAGING = YES
 AT_SPI2_ATK_DEPENDENCIES = atk at-spi2-core libglib2 host-pkgconf
 AT_SPI2_ATK_CONF_OPTS = -Dtests=false
-- 
2.29.2
