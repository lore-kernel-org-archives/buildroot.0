From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Nov 2015 07:53:24 -0300
Subject: [Buildroot] [PATCH] util-linux: bump to version 2.27.1
Message-ID: <1446548004-23729-1-git-send-email-gustavo@zacarias.com.ar>
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
index b97bda2..de60823 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/util-linux/v2.27/sha256sums.asc
-sha256 fcbf04e3ef8377fc8369af7f9afee341c5eef9b02dd5a7ce71532d0957e86dc7  util-linux-2.27.tar.xz
+sha256 0a818fcdede99aec43ffe6ca5b5388bff80d162f2f7bd4541dca94fecb87a290  util-linux-2.27.1.tar.xz
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 7b68c33..58ace1d 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
 UTIL_LINUX_VERSION_MAJOR = 2.27
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
-- 
2.4.10
