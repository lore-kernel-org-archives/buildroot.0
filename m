From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed, 27 Jun 2012 21:52:24 +0100
Subject: [Buildroot] [PATCH] memtester: bump to version 4.3.0
Message-ID: <1340830344-7705-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 ...file-fix.patch => memtester-makefile-fix.patch} |    0
 package/memtester/memtester.mk                     |    2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename package/memtester/{memtester-4.2.1-makefile-fix.patch => memtester-makefile-fix.patch} (100%)

diff --git a/package/memtester/memtester-4.2.1-makefile-fix.patch b/package/memtester/memtester-makefile-fix.patch
similarity index 100%
rename from package/memtester/memtester-4.2.1-makefile-fix.patch
rename to package/memtester/memtester-makefile-fix.patch
diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index 00e3124..a8b4f84 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -3,7 +3,7 @@
 # memtester
 #
 #############################################################
-MEMTESTER_VERSION = 4.2.1
+MEMTESTER_VERSION = 4.3.0
 MEMTESTER_SOURCE = memtester-$(MEMTESTER_VERSION).tar.gz
 MEMTESTER_SITE = http://pyropus.ca/software/memtester/old-versions/
 
-- 
1.7.9.5
