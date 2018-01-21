From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 21 Jan 2018 21:42:48 +0100
Subject: [Buildroot] [PATCH] libuv: bump to version 1.19.1
Message-ID: <20180121204248.4505-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add license hash.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/libuv/libuv.hash | 3 ++-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 748e1d2f0f..cc5a30ae10 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256  fe53b53eee3b15db8ae1b25cbfb8740944273e02f5ccd731b176800e2807d832  libuv-v1.16.0.tar.gz
+sha256  8d96a6230af4f9f33d6ec021b599e157279a2af72ed38cf4a8c25e6d58d952ef  libuv-v1.19.1.tar.gz
+sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index bbb42823b4..2666c14f93 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.16.0
+LIBUV_VERSION = v1.19.1
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
-- 
2.16.0
