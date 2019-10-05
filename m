From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Oct 2019 18:43:00 +0200
Subject: [Buildroot] [PATCH 1/1] libostree: bump to version 2019.4
Message-ID: <20191005164300.22419-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Marcus Folkesson <marcus.folkesson@gmail.com>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
[Bernd: bump to version 2019.4]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
This patch supersedes http://patchwork.ozlabs.org/patch/1152745/

 package/libostree/libostree.hash | 2 +-
 package/libostree/libostree.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index ddd15b5099..ee9c46fbde 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 f263cfed75dcc9e312a874d28241e7143d8a0d8c774938f2165327bae67dbe06  libostree-2018.9.1.tar.xz
+sha256 8dcb25f9d1eb38f3e528f12cf1c73dcfeb5ff23c2fe7da49a0d9ea80388a9d76  libostree-2019.4.tar.xz
 sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index e8cdd64d6e..f334d42db4 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION_MAJOR = 2018.9
-LIBOSTREE_VERSION= $(LIBOSTREE_VERSION_MAJOR).1
+LIBOSTREE_VERSION_MAJOR = 2019.4
+LIBOSTREE_VERSION= $(LIBOSTREE_VERSION_MAJOR)
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION_MAJOR)
 
-- 
2.20.1
