From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  3 Jan 2017 18:44:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/zlib: bump version to 1.2.10
Message-ID: <20170103174445.7393-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changed _SITE url to the upstream project site because Sourceforge does
not provide the tarball for 1.2.10 as of now.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/zlib/zlib.hash | 2 +-
 package/zlib/zlib.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zlib/zlib.hash b/package/zlib/zlib.hash
index d6382f8d3..17dc9b4b8 100644
--- a/package/zlib/zlib.hash
+++ b/package/zlib/zlib.hash
@@ -1,2 +1,2 @@
 # From http://www.zlib.net/
-md5	28f1205d8dd2001f26fec1e8c2cebe37	zlib-1.2.8.tar.xz
+sha256 9612bf086047078ce3a1c154fc9052113fc1a2a97234a059da17a6299bd4dd32  zlib-1.2.10.tar.xz
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 53eb84e15..ba07f2cf7 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ZLIB_VERSION = 1.2.8
+ZLIB_VERSION = 1.2.10
 ZLIB_SOURCE = zlib-$(ZLIB_VERSION).tar.xz
-ZLIB_SITE = http://downloads.sourceforge.net/project/libpng/zlib/$(ZLIB_VERSION)
+ZLIB_SITE = http://www.zlib.net
 ZLIB_LICENSE = zlib license
 ZLIB_LICENSE_FILES = README
 ZLIB_INSTALL_STAGING = YES
-- 
2.11.0
