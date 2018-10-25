From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 25 Oct 2018 21:05:27 +0200
Subject: [Buildroot] [PATCH] libostree: bump to version 2018.9
Message-ID: <20181025190527.27576-1-marcus.folkesson@gmail.com>
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
index d41016ed7a..35bf2caf0a 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 beef6debb0065bf1dc7538cd036c5f0348ac102ca4ad6d8651feff146130a844  libostree-2018.8.tar.xz
+sha256 9a3c17af133e6d381bb997473c6371ef8f048c1cfb6bd0acdb5662ede712aa5a  libostree-2018.9.tar.xz
 sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 66c5e5b5b0..4c841dbe4d 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2018.8
+LIBOSTREE_VERSION = 2018.9
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.19.1
