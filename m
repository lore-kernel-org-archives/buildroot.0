From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 11 Jun 2021 17:40:35 +0300
Subject: [Buildroot] [PATCH 1/1] libwpe: bump to version 1.10.1
Message-ID: <20210611144035.443935-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This minor release fixes a build issue when Meson is running under
a version of Python older than 3.6; release notes:

  https://wpewebkit.org/release/libwpe-1.10.1.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libwpe/libwpe.hash | 8 ++++----
 package/libwpe/libwpe.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
index 66fd168dc3..200b6c2798 100644
--- a/package/libwpe/libwpe.hash
+++ b/package/libwpe/libwpe.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/libwpe-1.10.0.tar.xz.sums
-md5  269ecb60d4ef80a0877d25a5828c8b82  libwpe-1.10.0.tar.xz
-sha1  b3f48a48b0401da19deb60cb8f15f193dff799c1  libwpe-1.10.0.tar.xz
-sha256  2415e270d45e3595ed4052bc105f733744dc2d3677e12ff4a831e5029841084d  libwpe-1.10.0.tar.xz
+# From https://wpewebkit.org/releases/libwpe-1.10.1.tar.xz.sums
+md5  f60fc13b519a66d262afb76c77441870  libwpe-1.10.1.tar.xz
+sha1  1a8085b9a172d37e952c07bbb09b1654d4161ab2  libwpe-1.10.1.tar.xz
+sha256  a327b3ffcf2356dbe8148c1db4bbdc5359d7e7163d177f67551a8393b144adf0  libwpe-1.10.1.tar.xz
 
 # Hashes for license files:
 sha256  35bef295cedbbf179eaee14328002587a0e7dc08ebf3f15ea080a6f2815f0d7b  COPYING
diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
index 43dc201f54..6396fe696d 100644
--- a/package/libwpe/libwpe.mk
+++ b/package/libwpe/libwpe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWPE_VERSION = 1.10.0
+LIBWPE_VERSION = 1.10.1
 LIBWPE_SITE = https://wpewebkit.org/releases
 LIBWPE_SOURCE = libwpe-$(LIBWPE_VERSION).tar.xz
 LIBWPE_INSTALL_STAGING = YES
-- 
2.32.0
