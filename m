From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 22 Apr 2015 10:03:52 +0200
Subject: [Buildroot] [PATCH] Makefile: fix typo in a comment
Message-ID: <1429689832-26900-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d1d6ab3..5de4789 100644
--- a/Makefile
+++ b/Makefile
@@ -577,7 +577,7 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 endif
 
 	mkdir -p $(TARGET_DIR)/etc
-	# Mandatory configuration file and auxilliary cache directory
+	# Mandatory configuration file and auxiliary cache directory
 	# for recent versions of ldconfig
 	touch $(TARGET_DIR)/etc/ld.so.conf
 	mkdir -p $(TARGET_DIR)/var/cache/ldconfig
-- 
1.9.1
