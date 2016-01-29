From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 29 Jan 2016 22:38:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/memtest86: bump to version 5.01
Message-ID: <1454103523-30518-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/memtest86/memtest86.hash | 2 +-
 package/memtest86/memtest86.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/memtest86/memtest86.hash b/package/memtest86/memtest86.hash
index cac0be7..81ad98e 100644
--- a/package/memtest86/memtest86.hash
+++ b/package/memtest86/memtest86.hash
@@ -1,2 +1,2 @@
 # locally computed using sha256sum
-sha256	5630ce978d0e6b671891df4253fc5c54659764d0cdfc7515ac0df3d8dd9e8737  memtest86+-4.20.tar.gz
+sha256	142127b7953fbd829b1057fb64a78d3340c2b771484230a7347e94530a0d9039	memtest86+-5.01.tar.gz
diff --git a/package/memtest86/memtest86.mk b/package/memtest86/memtest86.mk
index ef98f61..d2ec1a7 100644
--- a/package/memtest86/memtest86.mk
+++ b/package/memtest86/memtest86.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMTEST86_VERSION = 4.20
+MEMTEST86_VERSION = 5.01
 MEMTEST86_SOURCE = memtest86+-$(MEMTEST86_VERSION).tar.gz
 MEMTEST86_SITE = http://www.memtest.org/download/$(MEMTEST86_VERSION)
 MEMTEST86_LICENSE = GPLv2
@@ -16,4 +16,3 @@ define MEMTEST86_INSTALL_TARGET_CMDS
 endef
 
 $(eval $(generic-package))
-
-- 
2.7.0.rc3
