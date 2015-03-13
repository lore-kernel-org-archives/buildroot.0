From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 13 Mar 2015 18:01:31 -0300
Subject: [Buildroot] [PATCH] util-linux: bump to version 2.26.1
Message-ID: <1426280491-15167-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/util-linux/util-linux.hash | 2 +-
 package/util-linux/util-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index d28d681..d9e0965 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/util-linux/v2.26/sha256sums.asc
-sha256	a23c6f39dea0ed215ccd589509ffc7bb6f706f6e1a04760f493fb0fd7e93c489	util-linux-2.26.tar.xz
+sha256	22dc1c957262e2cbdfb4d524a63d5cd4f219d3ac9b5eab570fc771076799bb6e	util-linux-2.26.1.tar.xz
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index cb4b480..766f80f 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
 UTIL_LINUX_VERSION_MAJOR = 2.26
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
-- 
2.0.5
