From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri,  2 Dec 2016 08:42:14 +0100
Subject: [Buildroot] [PATCH] package/libuv: bump version to v1.10.1
Message-ID: <20161202074214.8897-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 75c7ffe..412479f 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a6ca9f0648973d1463f46b495ce546ddcbe7cce2f04b32e802a15539e46c57ad  libuv-v1.9.1.tar.gz
+sha256  4b5f71939dd4272ebcfb8e04833e9a273a08b1bf1277d37d14085d7b04b19832  libuv-v1.10.1.tar.gz
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 11d51dd..745c077 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.9.1
+LIBUV_VERSION = v1.10.1
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
-- 
2.10.2
