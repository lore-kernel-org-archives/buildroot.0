From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Jan 2014 21:43:55 +0100
Subject: [Buildroot] [git commit] sshfs: bump to version 2.5
Message-ID: <20140129204559.0AE7B9C6DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8a96c0d17a8e4a842d5a48d8f54dec272f17c59
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sshfs/sshfs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
