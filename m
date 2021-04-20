From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Apr 2021 15:11:24 -0500
Subject: [Buildroot] [PATCH 03/25] package/cgroupfs-mount: add _CPE_ID_VENDOR
In-Reply-To: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210420201146.42858-3-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:cgroupfs-mount_project:cgroupfs-mount:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:cgroupfs-mount_project:cgroupfs-mount

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
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
-- 
2.17.1
