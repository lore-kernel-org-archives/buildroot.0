From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Fri, 23 Mar 2018 09:00:33 +0100
Subject: [Buildroot] [PATCH] libostree: bump to version 2018.4
Message-ID: <20180323080033.10160-1-marcus.folkesson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---

Yep, a quick turnaround after 2018.3.

 package/libostree/libostree.hash | 2 +-
 package/libostree/libostree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index 096c094300..1f0e9ce95f 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 e54d0ac024f718cfa77b93d57c91c574bebcb937c88e1e30c3d1127e9360fd4b  libostree-2018.3.tar.xz
+sha256 f5b1e083ed630fd32a263731fe9595ecdd07cfd5cba3e354931f481c4181de1c  libostree-2018.4.tar.xz
 sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index ad20d2a593..ba6379d7e7 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2018.3
+LIBOSTREE_VERSION = 2018.4
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.16.2
