From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 20 Dec 2017 11:01:30 +0100
Subject: [Buildroot] [PATCH] libostree: bump to version 2017.15
Message-ID: <20171220100130.10607-1-marcus.folkesson@gmail.com>
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
index b0a5580a5a..522c9f4d24 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 cab4782a7ab1c4d7ab8e390372788b73a7f83d9284418ba36a42b60cbc67851e  libostree-2017.14.tar.xz
+sha256 564b46c83373ea35f44eb39e62c6f6c876c8f2649aa30124b3f87282d2175138  libostree-2017.15.tar.xz
 sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index cddde379df..612c284870 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2017.14
+LIBOSTREE_VERSION = 2017.15
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.15.1
