From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 13 Sep 2019 17:16:27 +0300
Subject: [Buildroot] [PATCH 1/1] package/ccache: bump to version 3.7.4
Message-ID: <20190913141627.26351-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update CCACHE_SITE to github.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/ccache/ccache.hash | 2 +-
 package/ccache/ccache.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 779a2abc7e..4d0b678388 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
-sha256  a6b129576328fcefad00cb72035bc87bc98b6a76aec0f4b59bed76d67a399b1f  ccache-3.6.tar.xz
+sha256  04c0af414b8cf89e541daed59735547fbfd323b1aaa983da0216f6b6731e6836  ccache-3.7.4.tar.xz
 sha256  ec6b1a326ff93b2cc21df88a697ae470ff6927a55b8929e7e491b315e1563361  GPL-3.0.txt
 sha256  2af7b3ec0ea737e1542e58db016122f6d75df9ea3b4f00c8151ecfef7040b39b  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 4d9de0a074..47735850b1 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 3.6
-CCACHE_SITE = https://www.samba.org/ftp/ccache
+CCACHE_VERSION = 3.7.4
+CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
 CCACHE_LICENSE_FILES = LICENSE.adoc GPL-3.0.txt
-- 
2.20.1
