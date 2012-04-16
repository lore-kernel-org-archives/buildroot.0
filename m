From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 Apr 2012 22:07:08 +0200
Subject: [Buildroot] [git commit] sshfs: bump to version 2.4
Message-ID: <20120416200913.0DFA296AB1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cf9e38ff8247e9d3fcff618d482c680c3f7aae99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
