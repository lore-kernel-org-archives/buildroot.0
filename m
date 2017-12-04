From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon,  4 Dec 2017 21:02:20 +0100
Subject: [Buildroot] [PATCH] libostree: bump to version 2017.14
Message-ID: <20171204200220.11728-1-marcus.folkesson@gmail.com>
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
index 162af31809..b0a5580a5a 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 a8b06cd81b40072b127e9a8aa5d8c7a61bb44d8bc0e7f7b73dee2ce4d9b3e752  libostree-2017.13.tar.xz
+sha256 cab4782a7ab1c4d7ab8e390372788b73a7f83d9284418ba36a42b60cbc67851e  libostree-2017.14.tar.xz
 sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index b0bcf01bff..0e5eef717b 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2017.13
+LIBOSTREE_VERSION = 2017.14
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.15.0
