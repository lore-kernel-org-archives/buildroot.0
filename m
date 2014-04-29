From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 29 Apr 2014 18:55:14 +0200
Subject: [Buildroot] [PATCH] ljsyscall: bump to version 0.10
Message-ID: <1398790514-32389-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/ljsyscall/ljsyscall.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ljsyscall/ljsyscall.mk b/package/ljsyscall/ljsyscall.mk
index cc49890..a17da3f 100644
--- a/package/ljsyscall/ljsyscall.mk
+++ b/package/ljsyscall/ljsyscall.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LJSYSCALL_VERSION = v0.9
+LJSYSCALL_VERSION = v0.10
 LJSYSCALL_SITE = $(call github,justincormack,ljsyscall,$(LJSYSCALL_VERSION))
 LJSYSCALL_LICENSE = MIT
 LJSYSCALL_LICENSE_FILES = COPYRIGHT
-- 
1.9.1
