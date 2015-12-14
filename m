From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 14 Dec 2015 23:48:23 +0100
Subject: [Buildroot] [PATCH] package/libuv: bump to version 1.8.0
Message-ID: <1450133303-7756-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 6f38b8b..abbbb0c 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 11d10f12d68fa655fff18c6021e8e45bc610e7baee006f17247b1830ee316093  libuv-v1.7.5.tar.gz
+sha256 906e1a5c673c95cb261adeacdb7308a65b4a8f7c9c50d85f3021364951fa9cde  libuv-v1.8.0.tar.gz
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index da47b62..bf1dead 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.7.5
+LIBUV_VERSION = v1.8.0
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
-- 
2.6.4
