From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 22 Jan 2021 08:10:36 +0100
Subject: [Buildroot] [PATCH 15/15] package/libmatroska: add
 LIBMATROSKA_CPE_ID_VENDOR
Message-ID: <20210122071036.3674-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:matroska:libmatroska is a valid CPE identifier for this
package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=libmatroska

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/libmatroska/libmatroska.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmatroska/libmatroska.mk b/package/libmatroska/libmatroska.mk
index 61222c2bf7..91727ae973 100644
--- a/package/libmatroska/libmatroska.mk
+++ b/package/libmatroska/libmatroska.mk
@@ -10,6 +10,7 @@ LIBMATROSKA_SITE = http://dl.matroska.org/downloads/libmatroska
 LIBMATROSKA_INSTALL_STAGING = YES
 LIBMATROSKA_LICENSE = LGPL-2.1+
 LIBMATROSKA_LICENSE_FILES = LICENSE.LGPL
+LIBMATROSKA_CPE_ID_VENDOR = matroska
 LIBMATROSKA_DEPENDENCIES = libebml host-pkgconf
 
 $(eval $(cmake-package))
-- 
2.30.0
