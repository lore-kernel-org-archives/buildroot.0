From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon,  7 Sep 2020 13:41:09 +0200
Subject: [Buildroot] [PATCH] package/libostree: bump to version 2020.6
Message-ID: <20200907114109.511497-1-marcus.folkesson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libostree/libostree.hash | 2 +-
 package/libostree/libostree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index 2ebc560d83..e5483a539c 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5877396ea092f5b6701c17bd20280746cad20f55a94c760dbeba0fa115818c05  libostree-2020.3.tar.xz
+sha256  865d4818820d128a2e505380358275bb964984348b3d0685b6455099e4736972  libostree-2020.6.tar.xz
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 57d9e98d72..e387f99856 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2020.3
+LIBOSTREE_VERSION = 2020.6
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.27.0
