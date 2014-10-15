From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Wed, 15 Oct 2014 09:25:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnfs: bump to version 1.9.5
Message-ID: <1413357933-10973-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* bump to version 1.9.5
* fix version and site symbol

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/libnfs/libnfs.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
index a17d8c3..f2d7938 100644
--- a/package/libnfs/libnfs.mk
+++ b/package/libnfs/libnfs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBNFS_VERSION = libnfs-1.8.0
-LIBNFS_SITE = $(call github,sahlberg,libnfs,$(LIBNFS_VERSION))
+LIBNFS_VERSION = 1.9.5
+LIBNFS_SITE = $(call github,sahlberg,libnfs,libnfs-$(LIBNFS_VERSION))
 LIBNFS_INSTALL_STAGING = YES
 LIBNFS_AUTORECONF = YES
 LIBNFS_MAKE = $(MAKE1)
-- 
2.1.2
