From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 22:36:08 +0200
Subject: [Buildroot] [git commit] package/libwpe: bump to version 1.8.0
Message-ID: <20200917203110.CE35E82639@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e8686be9f045457ca7c919c9e13db67234c740d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:

  https://wpewebkit.org/release/libwpe-1.8.0.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libwpe/libwpe.hash | 8 ++++----
 package/libwpe/libwpe.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
index e138c06f2b..36cdf56664 100644
--- a/package/libwpe/libwpe.hash
+++ b/package/libwpe/libwpe.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/libwpe-1.6.0.tar.xz.sums
-md5  6e8a2c279dcc3617db5ec7ac4c03d628  libwpe-1.6.0.tar.xz
-sha1  e8424d5e29f35861d85acdc5962d8b59b53bb1ad  libwpe-1.6.0.tar.xz
-sha256  3587c6b8a807f4bb76b268ba74ca82c6b395b90235db41ad8252224456193c90  libwpe-1.6.0.tar.xz
+# From https://wpewebkit.org/releases/libwpe-1.8.0.tar.xz.sums
+md5  328ea59dd8dee9107a49353536d00844  libwpe-1.8.0.tar.xz
+sha1  3c893b1e8118a06f082d98373e279a8f8e33750d  libwpe-1.8.0.tar.xz
+sha256  a6f00a7d091cbd4db57fe7ee3b4c12c6350921d654ed79812800a26c888481d2  libwpe-1.8.0.tar.xz
 
 # Hashes for license files:
 sha256  35bef295cedbbf179eaee14328002587a0e7dc08ebf3f15ea080a6f2815f0d7b  COPYING
diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
index fd4f3d0cbd..6c3a1d354a 100644
--- a/package/libwpe/libwpe.mk
+++ b/package/libwpe/libwpe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWPE_VERSION = 1.6.0
+LIBWPE_VERSION = 1.8.0
 LIBWPE_SITE = https://wpewebkit.org/releases
 LIBWPE_SOURCE = libwpe-$(LIBWPE_VERSION).tar.xz
 LIBWPE_INSTALL_STAGING = YES
