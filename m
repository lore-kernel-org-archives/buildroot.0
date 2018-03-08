From: Martin Bark <martin@barkynet.com>
Date: Thu,  8 Mar 2018 16:16:39 +0000
Subject: [Buildroot] [PATCH 2/4] package/libuv: bump version to 1.19.2
In-Reply-To: <1520525801-23577-1-git-send-email-martin@barkynet.com>
References: <1520525801-23577-1-git-send-email-martin@barkynet.com>
Message-ID: <1520525801-23577-2-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index cc5a30a..1a2833e 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8d96a6230af4f9f33d6ec021b599e157279a2af72ed38cf4a8c25e6d58d952ef  libuv-v1.19.1.tar.gz
+sha256  ccc5f3b43ed171640513786e5e809508cb6308279b4d71a016e4550ad62f1686  libuv-v1.19.2.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 2666c14..2e07d3a 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.19.1
+LIBUV_VERSION = v1.19.2
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
-- 
2.7.4
