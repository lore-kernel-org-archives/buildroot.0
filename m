From: Asaf Kahlon <asafka7@gmail.com>
Date: Sun, 20 Oct 2019 11:15:39 +0300
Subject: [Buildroot] [PATCH 1/1] package/libuv: bump to version 1.33.1
Message-ID: <20191020081542.5711-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/017ce1062a61b25f949c0b8c4b73cac128037901

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 3a9526cf9f..3890c8af94 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d085b46aea791fb7772c274ccc58faadc56fdf6252d3b09b7fb24bd03881efdb  libuv-1.33.0.tar.gz
+sha256  63794499bf5da1720e249d3fc14ff396b70b8736effe6ce5b4e47e0f3d476467  libuv-1.33.1.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 9e58de6734..d5f1d7dbab 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = 1.33.0
+LIBUV_VERSION = 1.33.1
 LIBUV_SITE = $(call github,libuv,libuv,v$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
-- 
2.20.1
