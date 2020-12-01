From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue,  1 Dec 2020 08:00:05 +0100
Subject: [Buildroot] [PATCH] package/libostree: bump to version 2020.8
Message-ID: <20201201070005.147684-1-marcus.folkesson@gmail.com>
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
index e5483a539c..751feb6b2e 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  865d4818820d128a2e505380358275bb964984348b3d0685b6455099e4736972  libostree-2020.6.tar.xz
+sha256  fdaa5992d0a6f62157152355449ac8476c50df6602be398e9ad10438cc1e679b  libostree-2020.8.tar.xz
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index e387f99856..9406e023bd 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2020.6
+LIBOSTREE_VERSION = 2020.8
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.27.0
