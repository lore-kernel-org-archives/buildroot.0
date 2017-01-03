From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Jan 2017 23:51:26 +0100
Subject: [Buildroot] [git commit] package/zlib: bump version to 1.2.10
Message-ID: <20170103225412.BC5B37FB7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=268e5b82a6432c165a2e90c51daf259d8a388ce0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changed _SITE url to the upstream project site because Sourceforge does
not provide the tarball for 1.2.10 as of now.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zlib/zlib.hash | 2 +-
 package/zlib/zlib.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zlib/zlib.hash b/package/zlib/zlib.hash
index d6382f8..17dc9b4 100644
--- a/package/zlib/zlib.hash
+++ b/package/zlib/zlib.hash
@@ -1,2 +1,2 @@
 # From http://www.zlib.net/
-md5	28f1205d8dd2001f26fec1e8c2cebe37	zlib-1.2.8.tar.xz
+sha256 9612bf086047078ce3a1c154fc9052113fc1a2a97234a059da17a6299bd4dd32  zlib-1.2.10.tar.xz
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 53eb84e..ba07f2c 100644
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
