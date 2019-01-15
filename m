From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 15 Jan 2019 21:43:34 +0200
Subject: [Buildroot] [PATCH 1/1] ccache: bump to version 3.6
Message-ID: <20190115194334.28223-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License update - a year bump.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 4ea2305a88..779a2abc7e 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
-sha256  bdd44b72ae4506a2e2deef9fefb15c606a474bbca7658cd2be26105155eec012  ccache-3.5.tar.xz
+sha256  a6b129576328fcefad00cb72035bc87bc98b6a76aec0f4b59bed76d67a399b1f  ccache-3.6.tar.xz
 sha256  ec6b1a326ff93b2cc21df88a697ae470ff6927a55b8929e7e491b315e1563361  GPL-3.0.txt
-sha256  449995742c9358c55b40cefbea5d2c7f05280454d562b6e17a75f46d2c2f6e85  LICENSE.adoc
+sha256  2af7b3ec0ea737e1542e58db016122f6d75df9ea3b4f00c8151ecfef7040b39b  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 76ae029eae..4d9de0a074 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 3.5
+CCACHE_VERSION = 3.6
 CCACHE_SITE = https://www.samba.org/ftp/ccache
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
-- 
2.19.1
