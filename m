From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 11 Dec 2019 21:27:16 +0100
Subject: [Buildroot] [PATCH] package/libostree: bump to version 2019.6
Message-ID: <20191211202716.5713-1-marcus.folkesson@gmail.com>
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
index 8d943a2ded..374f278f42 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 9568156d147865f0f744373288039dbde784c0cf1de37fdd2cacf4e950790875  libostree-2019.5.tar.xz
+sha256 5482b8fc179c6d2861acb176a1c379e4d02f709bffa92e63f5360f65e57219ae  libostree-2019.6.tar.xz
 sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index e10bde68db..bdbe6b5aba 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION_MAJOR = 2019.5
+LIBOSTREE_VERSION_MAJOR = 2019.6
 LIBOSTREE_VERSION= $(LIBOSTREE_VERSION_MAJOR)
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION_MAJOR)
-- 
2.24.0
