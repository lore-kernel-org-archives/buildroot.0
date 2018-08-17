From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 17 Aug 2018 08:00:51 +0300
Subject: [Buildroot] [PATCH 1/1] libuv: bump to version 1.23.0
Message-ID: <20180817050051.21477-1-asafka7@gmail.com>
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
index c9f6565ef3..e687450d53 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c72f0401e1298f948daf310abafce38373a926fb9438464d1bf7fe90784544e0  libuv-v1.22.0.tar.gz
+sha256  8c8eff0bec85306aae508392b395e8bb0e1e34daad2a4e3bec308ced0c92bfaa  libuv-v1.23.0.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 85e8dccb63..90818ad789 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.22.0
+LIBUV_VERSION = v1.23.0
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
-- 
2.17.1
