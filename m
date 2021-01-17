From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 14:56:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/libao: add LIBAO_CPE_ID_VENDOR
Message-ID: <20210117135627.344431-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:xiph:libao is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Axiph%3Alibao

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libao/libao.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libao/libao.mk b/package/libao/libao.mk
index 501ea0c9f2..19a4c165c6 100644
--- a/package/libao/libao.mk
+++ b/package/libao/libao.mk
@@ -10,6 +10,7 @@ LIBAO_DEPENDENCIES = host-pkgconf
 LIBAO_INSTALL_STAGING = YES
 LIBAO_LICENSE = GPL-2.0+
 LIBAO_LICENSE_FILES = COPYING
+LIBAO_CPE_ID_VENDOR = xiph
 LIBAO_CONF_OPTS = \
 	--disable-esd \
 	--disable-wmm \
-- 
2.29.2
