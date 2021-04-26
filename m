From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 14:59:12 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/cgroupfs-mount:
 add _CPE_ID_VENDOR
Message-ID: <20210426125912.83BB4817A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1d4f6277bdb0202d05d97586cc72acc0913171a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:cgroupfs-mount_project:cgroupfs-mount:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:cgroupfs-mount_project:cgroupfs-mount

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ad9f909ea64fd43c504c4bd883267ce9bead6f99)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cgroupfs-mount/cgroupfs-mount.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cgroupfs-mount/cgroupfs-mount.mk b/package/cgroupfs-mount/cgroupfs-mount.mk
index 9a76799952..acf7442056 100644
--- a/package/cgroupfs-mount/cgroupfs-mount.mk
+++ b/package/cgroupfs-mount/cgroupfs-mount.mk
@@ -8,6 +8,7 @@ CGROUPFS_MOUNT_VERSION = 1.4
 CGROUPFS_MOUNT_SITE = $(call github,tianon,cgroupfs-mount,$(CGROUPFS_MOUNT_VERSION))
 CGROUPFS_MOUNT_LICENSE = GPL-3.0+
 CGROUPFS_MOUNT_LICENSE_FILES = debian/copyright
+CGROUPFS_MOUNT_CPE_ID_VENDOR = cgroupfs-mount_project
 
 define CGROUPFS_MOUNT_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/cgroupfs-mount $(TARGET_DIR)/usr/bin/cgroupfs-mount
