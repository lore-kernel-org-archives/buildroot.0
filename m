From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Jan 2019 17:04:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpng: bump version to 1.6.36
Message-ID: <20190127160421.22279-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License[1] was bumped to v2, for details see
http://lists.opensource.org/pipermail/license-review_lists.opensource.org/2018-November/003791.html

[1] http://www.libpng.org/pub/png/src/libpng-LICENSE.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libpng/libpng.hash | 11 +++++------
 package/libpng/libpng.mk   |  4 ++--
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 27f66a5d01..066d2c3bcd 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,7 +1,6 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.35/
-md5		678b7e696a62a193ed3503b04bf449d6			libpng-1.6.35.tar.xz
-sha1	0df1561aa1da610e892239348970d574b14deed0	libpng-1.6.35.tar.xz
-
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.36/
+md5 df2be2d29c40937fe1f5349b16bc2826  libpng-1.6.36.tar.xz
+sha1 aec9548c8319104226cc4c31d1f5e524f1b55295  libpng-1.6.36.tar.xz
 # Locally computed:
-sha256	23912ec8c9584917ed9b09c5023465d71709dce089be503c7867fec68a93bcd7	libpng-1.6.35.tar.xz
-sha256	f9850940c6606003eea9c8864b2a3f177eb5c963614aba5a3c5a24c47dd043ab	LICENSE
+sha256 eceb924c1fa6b79172fdfd008d335f0e59172a86a66481e09d4089df872aa319  libpng-1.6.36.tar.xz
+sha256 142da07fb4b0cceb861b2e69fe7e5b602f25ec7adc85b0a426133d9ee0d2e116  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index b6d1d8d071..6de8dc12de 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.35
+LIBPNG_VERSION = 1.6.36
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
-LIBPNG_LICENSE = Libpng
+LIBPNG_LICENSE = Libpng v2
 LIBPNG_LICENSE_FILES = LICENSE
 LIBPNG_INSTALL_STAGING = YES
 LIBPNG_DEPENDENCIES = host-pkgconf zlib
-- 
2.20.1
