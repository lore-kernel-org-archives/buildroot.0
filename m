From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 21 Mar 2018 19:39:30 +0100
Subject: [Buildroot] [PATCH] libostree: bump to version 2018.3
Message-ID: <20180321183930.17911-1-marcus.folkesson@gmail.com>
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
index 6ae4824007..096c094300 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 37661de4a0ac73af5d921f494f17dd052ae2844111ba7c5aaeb1cbc4aae94bea  libostree-2018.2.tar.xz
+sha256 e54d0ac024f718cfa77b93d57c91c574bebcb937c88e1e30c3d1127e9360fd4b  libostree-2018.3.tar.xz
 sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 236657e9fa..ad20d2a593 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2018.2
+LIBOSTREE_VERSION = 2018.3
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.16.2
