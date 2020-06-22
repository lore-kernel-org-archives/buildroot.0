From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 22 Jun 2020 22:54:56 +0300
Subject: [Buildroot] [PATCH 1/1] package/ccache: bump to version 3.7.10
Message-ID: <20200622195456.269691-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/ccache/ccache.hash | 2 +-
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 0bd00e07d0..5d9dfdb46e 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
-sha256  f893da7543bfb9172bd55e603fcbdfcd83e6def176a28689c13235695b4cf44b  ccache-3.7.9.tar.xz
+sha256  0c9566d8eafaec2c5e5c0d9a91e921c858fcf349284a105ab524407b9b54ed28  ccache-3.7.10.tar.xz
 sha256  ec6b1a326ff93b2cc21df88a697ae470ff6927a55b8929e7e491b315e1563361  GPL-3.0.txt
 sha256  4f63223bcdee822d55a6768cc8399ffe06401d7a03cfe79e1dc305f50dc22c59  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 276665c3fc..fd6e741303 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 3.7.9
+CCACHE_VERSION = 3.7.10
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
-- 
2.26.2
