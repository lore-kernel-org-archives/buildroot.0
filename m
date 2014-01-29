From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 29 Jan 2014 16:24:09 -0300
Subject: [Buildroot] [PATCH] sshfs: bump to version 2.5
Message-ID: <1391023449-16030-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sshfs/sshfs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index de9b094..572f44e 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSHFS_VERSION = 2.4
+SSHFS_VERSION = 2.5
 SSHFS_SITE = http://downloads.sourceforge.net/project/fuse/sshfs-fuse/$(SSHFS_VERSION)
 SSHFS_SOURCE = sshfs-fuse-$(SSHFS_VERSION).tar.gz
 SSHFS_LICENSE = GPLv2
-- 
1.8.3.2
