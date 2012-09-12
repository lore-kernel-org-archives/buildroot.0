From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Sep 2012 10:51:55 -0300
Subject: [Buildroot] [PATCH 2/3] unionfs: bump to version 0.26
In-Reply-To: <1347457916-23684-1-git-send-email-gustavo@zacarias.com.ar>
References: <1347457916-23684-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1347457916-23684-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/unionfs/unionfs.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/unionfs/unionfs.mk b/package/unionfs/unionfs.mk
index 3b33824..e2ffd72 100644
--- a/package/unionfs/unionfs.mk
+++ b/package/unionfs/unionfs.mk
@@ -4,10 +4,12 @@
 #
 #############################################################
 
-UNIONFS_VERSION = 0.25
+UNIONFS_VERSION = 0.26
 UNIONFS_SITE = http://podgorny.cz/unionfs-fuse/releases
-UNIONFS_SOURCE = unionfs-fuse-$(UNIONFS_VERSION).tar.bz2
+UNIONFS_SOURCE = unionfs-fuse-$(UNIONFS_VERSION).tar.xz
 UNIONFS_DEPENDENCIES = libfuse
+UNIONFS_LICENSE = BSD-3c
+UNIONFS_LICENSE_FILES = LICENSE
 
 define UNIONFS_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-- 
1.7.8.6
