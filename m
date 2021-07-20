From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 20 Jul 2021 09:17:57 +0200
Subject: [Buildroot] [PATCH] package/libostree: bump to version 2021.3
Message-ID: <20210720071757.148895-1-marcus.folkesson@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libostree/libostree.hash | 2 +-
 package/libostree/libostree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index bc1249deed..928e4fbe1b 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  91b4bd9264831d20ff00ec442d48ede526db55379bd917606863c05f43b85a51  libostree-2021.1.tar.xz
+sha256  0fa5a39f0c3e58c2040133e4229cb28660c61b978cd4a2a3d2f6e97ef4c8d0b3  libostree-2021.3.tar.xz
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index a0e7e0ef0d..94ea08664a 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2021.1
+LIBOSTREE_VERSION = 2021.3
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.31.1
