From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Aug 2017 11:28:37 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libuv: bump version to 1.13.1
Message-ID: <20170805092837.6061-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index c8289cda5..f9fe4fe30 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  41ce914a88da21d3b07a76023beca57576ca5b376c6ac440c80bc581cbca1250  libuv-v1.12.0.tar.gz
+sha256 6a4976887594ec9f4e8521c95598dbbc478c59733056a5cf46354e93a1bc8400  libuv-v1.13.1.tar.gz
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 891ac7450..06c552008 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.12.0
+LIBUV_VERSION = v1.13.1
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
-- 
2.11.0
