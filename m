From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 12 Sep 2012 23:26:46 +0200
Subject: [Buildroot] [git commit] unionfs: bump to version 0.26
Message-ID: <20120912213354.5CE6C8B799@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bca9a642c9e9f272798135170a4eba49fb3d9a6e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
