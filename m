From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Apr 2012 11:34:56 -0300
Subject: [Buildroot] [PATCH 1/2] sshfs: bump to version 2.4
Message-ID: <1334586897-18826-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sshfs/sshfs.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index 738b4d0..e60cdeb 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-SSHFS_VERSION = 2.3
-SSHFS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fuse/$(SSHFS_VERSION)
+SSHFS_VERSION = 2.4
+SSHFS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/fuse/sshfs-fuse/$(SSHFS_VERSION)
 SSHFS_SOURCE = sshfs-fuse-$(SSHFS_VERSION).tar.gz
 SSHFS_DEPENDENCIES = \
 	libglib2 libfuse openssh \
-- 
1.7.3.4
