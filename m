From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 22:12:11 +0200
Subject: [Buildroot] [git commit] package/libwpe: bump to version 1.6.0
Message-ID: <20200329195852.3B3F38907D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=90e735f6d9172b4bfde86a8cfa7eb6b3ce5e8860
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libwpe/libwpe.hash | 10 +++++-----
 package/libwpe/libwpe.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
index 0a616a31cc..e138c06f2b 100644
--- a/package/libwpe/libwpe.hash
+++ b/package/libwpe/libwpe.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/libwpe-1.4.0.1.tar.xz.sums
-md5 1d4d38413ee0d0043f74d0445cab906f libwpe-1.4.0.1.tar.xz
-sha1 a41480a0a85cfa11b3f87f801b7c37bc3410e060 libwpe-1.4.0.1.tar.xz
-sha256 09849dfb34877354f34f318e138971cf22e677b2179e1f0a8ea00ab0b7bd8e9b libwpe-1.4.0.1.tar.xz
+# From https://wpewebkit.org/releases/libwpe-1.6.0.tar.xz.sums
+md5  6e8a2c279dcc3617db5ec7ac4c03d628  libwpe-1.6.0.tar.xz
+sha1  e8424d5e29f35861d85acdc5962d8b59b53bb1ad  libwpe-1.6.0.tar.xz
+sha256  3587c6b8a807f4bb76b268ba74ca82c6b395b90235db41ad8252224456193c90  libwpe-1.6.0.tar.xz
 
 # Hashes for license files:
-sha256 35bef295cedbbf179eaee14328002587a0e7dc08ebf3f15ea080a6f2815f0d7b COPYING
+sha256  35bef295cedbbf179eaee14328002587a0e7dc08ebf3f15ea080a6f2815f0d7b  COPYING
diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
index 09518ce9b1..fd4f3d0cbd 100644
--- a/package/libwpe/libwpe.mk
+++ b/package/libwpe/libwpe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWPE_VERSION = 1.4.0.1
+LIBWPE_VERSION = 1.6.0
 LIBWPE_SITE = https://wpewebkit.org/releases
 LIBWPE_SOURCE = libwpe-$(LIBWPE_VERSION).tar.xz
 LIBWPE_INSTALL_STAGING = YES
