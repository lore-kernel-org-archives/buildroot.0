From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 24 Oct 2014 19:09:34 -0300
Subject: [Buildroot] [PATCH 1/2] util-linux: bump to version 2.25.2
Message-ID: <1414188575-28860-1-git-send-email-gustavo@zacarias.com.ar>
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
index cfa1364..b5fc18e 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/util-linux/v2.25/sha256sums.asc
-sha256	4701305ae22790c3a92ce48e50794fa05b7ee01f4227f419a171c100d08986e8	util-linux-2.25.1.tar.xz
+sha256	e0457f715b73f4a349e1acb08cb410bf0edc9a74a3f75c357070f31f70e33cd6	util-linux-2.25.2.tar.xz
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 1d52b50..6ecd16d 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
 UTIL_LINUX_VERSION_MAJOR = 2.25
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
-- 
2.0.4
