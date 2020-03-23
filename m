From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 23 Mar 2020 14:28:09 +0100
Subject: [Buildroot] [PATCH] package/libostree: bump to version 2020.3
Message-ID: <20200323132809.252002-1-marcus.folkesson@gmail.com>
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
index 374f278f42..2c55b2614c 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 5482b8fc179c6d2861acb176a1c379e4d02f709bffa92e63f5360f65e57219ae  libostree-2019.6.tar.xz
+sha256 5877396ea092f5b6701c17bd20280746cad20f55a94c760dbeba0fa115818c05  libostree-2020.3.tar.xz
 sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index aed97b70cc..997a99b51e 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION_MAJOR = 2019.6
+LIBOSTREE_VERSION_MAJOR = 2020.3
 LIBOSTREE_VERSION= $(LIBOSTREE_VERSION_MAJOR)
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION_MAJOR)
-- 
2.25.1
