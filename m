From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jun 2016 10:32:28 +0200
Subject: [Buildroot] [git commit] gmp: bump to version 6.1.1
Message-ID: <20160622083404.996B28213A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc2c74d636828836f12086fad9737b553005e235
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gmp/gmp.hash | 2 +-
 package/gmp/gmp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gmp/gmp.hash b/package/gmp/gmp.hash
index e803623..9ea42e5 100644
--- a/package/gmp/gmp.hash
+++ b/package/gmp/gmp.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	68dadacce515b0f8a54f510edf07c1b636492bcdb8e8d54c56eb216225d16989	gmp-6.1.0.tar.xz
+sha256	d36e9c05df488ad630fff17edb50051d6432357f9ce04e34a09b3d818825e831	gmp-6.1.1.tar.xz
diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index e1d75dc..09753a0 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GMP_VERSION = 6.1.0
+GMP_VERSION = 6.1.1
 GMP_SITE = $(BR2_GNU_MIRROR)/gmp
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.xz
 GMP_INSTALL_STAGING = YES
