From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  3 Mar 2021 15:42:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/libvorbis: add
 LIBVORBIS_CPE_ID_VENDOR
Message-ID: <20210303144233.501143-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:xiph.org:libvorbis is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Axiph.org%3Alibvorbis

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvorbis/libvorbis.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libvorbis/libvorbis.mk b/package/libvorbis/libvorbis.mk
index 95c43d959e..c1baa18515 100644
--- a/package/libvorbis/libvorbis.mk
+++ b/package/libvorbis/libvorbis.mk
@@ -12,5 +12,6 @@ LIBVORBIS_CONF_OPTS = --disable-oggtest
 LIBVORBIS_DEPENDENCIES = host-pkgconf libogg
 LIBVORBIS_LICENSE = BSD-3-Clause
 LIBVORBIS_LICENSE_FILES = COPYING
+LIBVORBIS_CPE_ID_VENDOR = xiph.org
 
 $(eval $(autotools-package))
-- 
2.30.0
