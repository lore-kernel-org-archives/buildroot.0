From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Sat, 28 Oct 2017 10:28:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/util-linux: drop _VERSION_MINOR
	variable
Message-ID: <1509179300-4002-1-git-send-email-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
---
 package/util-linux/util-linux.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 83bb217..4b684b9 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 UTIL_LINUX_VERSION_MAJOR = 2.30
-UTIL_LINUX_VERSION_MINOR = 2
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).$(UTIL_LINUX_VERSION_MINOR)
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
-- 
1.9.1
