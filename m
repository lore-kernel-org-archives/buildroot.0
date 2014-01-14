From: Axel Lin <axel.lin@ingics.com>
Date: Tue, 14 Jan 2014 20:14:06 +0800
Subject: [Buildroot] [PATCH] tinymembench: bump to version 0.3
Message-ID: <1389701646.31519.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/tinymembench/tinymembench.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tinymembench/tinymembench.mk b/package/tinymembench/tinymembench.mk
index 8bb01d5..ab479d6 100644
--- a/package/tinymembench/tinymembench.mk
+++ b/package/tinymembench/tinymembench.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYMEMBENCH_VERSION = v0.2
+TINYMEMBENCH_VERSION = v0.3
 TINYMEMBENCH_SITE = $(call github,ssvb,tinymembench,$(TINYMEMBENCH_VERSION))
 TINYMEMBENCH_LICENSE = MIT
 TINYMEMBENCH_LICENSE_FILES = main.c
-- 
1.8.1.2
