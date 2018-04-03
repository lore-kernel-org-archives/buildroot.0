From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue,  3 Apr 2018 09:52:03 +0300
Subject: [Buildroot] [PATCH 1/1] libuv: bump to version v1.20.0
Message-ID: <20180403065203.23665-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 1a2833e786..c14b2d4971 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ccc5f3b43ed171640513786e5e809508cb6308279b4d71a016e4550ad62f1686  libuv-v1.19.2.tar.gz
+sha256  6d36f18f556cc288813032a168fd9181b45d9e66e3e18e54a8dbdfd8ea3c3dba  libuv-v1.20.0.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 2e07d3a0fa..54ce6bdaa6 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.19.2
+LIBUV_VERSION = v1.20.0
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
-- 
2.16.2
