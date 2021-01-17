From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jan 2021 14:53:34 +0100
Subject: [Buildroot] [git commit] package/libzip: add LIBZIP_CPE_ID_VENDOR
Message-ID: <20210117133645.9BFC9863FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a03fbb4fa92905675d0f8c04b90cfa4e0ca997d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libzip:libzip is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibzip%3Alibzip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libzip/libzip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index 9d64db32fa..4a028f970a 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -9,6 +9,7 @@ LIBZIP_SITE = https://libzip.org/download
 LIBZIP_SOURCE = libzip-$(LIBZIP_VERSION).tar.xz
 LIBZIP_LICENSE = BSD-3-Clause
 LIBZIP_LICENSE_FILES = LICENSE
+LIBZIP_CPE_ID_VENDOR = libzip
 LIBZIP_INSTALL_STAGING = YES
 LIBZIP_DEPENDENCIES = zlib
 HOST_LIBZIP_DEPENDENCIES = host-zlib
