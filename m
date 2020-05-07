From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  8 May 2020 00:41:49 +0200
Subject: [Buildroot] [PATCH 1/2] package/util-linux: renumber patches
Message-ID: <20200507224150.242211-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 3052da3eac8c80e7375341a48bca4cf0ee12e60b did not renumber
remaining patches, fix that

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...add-force.patch => 0001-blkdiscard-use-O_EXCL-add-force.patch} | 0
 ...=> 0002-libfdisk-add-fdisk_set_disklabel_id_from_string.patch} | 0
 ...patch => 0003-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch} | 0
 ...04-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch} | 0
 ...d-inckudes.patch => 0005-include-cleanup-pidfd-inckudes.patch} | 0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename package/util-linux/{0003-blkdiscard-use-O_EXCL-add-force.patch => 0001-blkdiscard-use-O_EXCL-add-force.patch} (100%)
 rename package/util-linux/{0004-libfdisk-add-fdisk_set_disklabel_id_from_string.patch => 0002-libfdisk-add-fdisk_set_disklabel_id_from_string.patch} (100%)
 rename package/util-linux/{0005-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch => 0003-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch} (100%)
 rename package/util-linux/{0006-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch => 0004-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch} (100%)
 rename package/util-linux/{0007-include-cleanup-pidfd-inckudes.patch => 0005-include-cleanup-pidfd-inckudes.patch} (100%)

diff --git a/package/util-linux/0003-blkdiscard-use-O_EXCL-add-force.patch b/package/util-linux/0001-blkdiscard-use-O_EXCL-add-force.patch
similarity index 100%
rename from package/util-linux/0003-blkdiscard-use-O_EXCL-add-force.patch
rename to package/util-linux/0001-blkdiscard-use-O_EXCL-add-force.patch
diff --git a/package/util-linux/0004-libfdisk-add-fdisk_set_disklabel_id_from_string.patch b/package/util-linux/0002-libfdisk-add-fdisk_set_disklabel_id_from_string.patch
similarity index 100%
rename from package/util-linux/0004-libfdisk-add-fdisk_set_disklabel_id_from_string.patch
rename to package/util-linux/0002-libfdisk-add-fdisk_set_disklabel_id_from_string.patch
diff --git a/package/util-linux/0005-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch b/package/util-linux/0003-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch
similarity index 100%
rename from package/util-linux/0005-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch
rename to package/util-linux/0003-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch
diff --git a/package/util-linux/0006-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch b/package/util-linux/0004-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch
similarity index 100%
rename from package/util-linux/0006-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch
rename to package/util-linux/0004-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch
diff --git a/package/util-linux/0007-include-cleanup-pidfd-inckudes.patch b/package/util-linux/0005-include-cleanup-pidfd-inckudes.patch
similarity index 100%
rename from package/util-linux/0007-include-cleanup-pidfd-inckudes.patch
rename to package/util-linux/0005-include-cleanup-pidfd-inckudes.patch
-- 
2.26.2
