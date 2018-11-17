From: Nasser Afshin <afshin.nasser@gmail.com>
Date: Sat, 17 Nov 2018 10:37:52 +0330
Subject: [Buildroot] [PATCH v2] libpng: bump to 1.6.35
Message-ID: <20181117070752.19815-1-afshin.nasser@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also use https instead of http to retrieve the hashes.

Note that the only changes in the LICENSE file is the copy-right date and
the version number.

Signed-off-by: Nasser Afshin <afshin.nasser@gmail.com>
---
v2: Add to the commit message: what has been changed in the license file.
(suggested by Baruch Siach)

 package/libpng/libpng.hash | 10 +++++-----
 package/libpng/libpng.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 0a0cebe..27f66a5 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.34/
-md5		c05b6ca7190a5e387b78657dbe5536b2			libpng-1.6.34.tar.xz
-sha1	45de4ec996ffcc3e18037e7c128abe95f4d0292a	libpng-1.6.34.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.35/
+md5		678b7e696a62a193ed3503b04bf449d6			libpng-1.6.35.tar.xz
+sha1	0df1561aa1da610e892239348970d574b14deed0	libpng-1.6.35.tar.xz
 
 # Locally computed:
-sha256	2f1e960d92ce3b3abd03d06dfec9637dfbd22febf107a536b44f7a47c60659f6	libpng-1.6.34.tar.xz
-sha256	a247c24f82bacf0403fe2f3d5550493a91cdb575fe7036b764bda8cacf3efd9c	LICENSE
+sha256	23912ec8c9584917ed9b09c5023465d71709dce089be503c7867fec68a93bcd7	libpng-1.6.35.tar.xz
+sha256	f9850940c6606003eea9c8864b2a3f177eb5c963614aba5a3c5a24c47dd043ab	LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index ace62cd..b6d1d8d 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.34
+LIBPNG_VERSION = 1.6.35
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
-- 
2.7.4
