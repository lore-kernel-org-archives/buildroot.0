From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2020 22:01:37 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/util-linux:
 renumber patches
Message-ID: <20200510203114.601E7814A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c77166012bf330b1f34995ca79d2b9c7f7d45e3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Commit 3052da3eac8c80e7375341a48bca4cf0ee12e60b did not renumber
remaining patches, fix that

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit df2f4386169488674b29cbd96e3c6bba28f87f22)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-O_EXCL-add-force.patch => 0001-blkdiscard-use-O_EXCL-add-force.patch} | 0
 ...g.patch => 0002-libfdisk-add-fdisk_set_disklabel_id_from_string.patch} | 0
 ...UUID-ID.patch => 0003-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch} | 0
 ...ch => 0004-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch} | 0
 ...nup-pidfd-inckudes.patch => 0005-include-cleanup-pidfd-inckudes.patch} | 0
 5 files changed, 0 insertions(+), 0 deletions(-)

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
