From: Martin Bark <martin@barkynet.com>
Date: Tue,  5 Sep 2017 21:09:22 +0100
Subject: [Buildroot] [PATCH 1/2] package/libuv: bump version to 1.14.0
Message-ID: <1504642163-21571-1-git-send-email-martin@barkynet.com>
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
index f9fe4fe..169a7be 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 6a4976887594ec9f4e8521c95598dbbc478c59733056a5cf46354e93a1bc8400  libuv-v1.13.1.tar.gz
+sha256  96088804334a70f84d64f45e4db926fc1dfa42d4a9d22b1812cf47bc0d9b6947  libuv-v1.14.0.tar.gz
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 06c5520..0b62c58 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.13.1
+LIBUV_VERSION = v1.14.0
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
-- 
2.7.4
