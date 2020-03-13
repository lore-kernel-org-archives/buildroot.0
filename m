From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu, 12 Mar 2020 22:04:18 -0300
Subject: [Buildroot] [PATCH] package/util-linux: add missing SOB to patches
Message-ID: <20200313010418.16872-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

It is required that all patches in packages have the Signed-off-by of
the contributor who brought them into Buildroot.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/util-linux/0003-blkdiscard-use-O_EXCL-add-force.patch    | 1 +
 .../0004-libfdisk-add-fdisk_set_disklabel_id_from_string.patch   | 1 +
 .../0005-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch         | 1 +
 3 files changed, 3 insertions(+)

diff --git a/package/util-linux/0003-blkdiscard-use-O_EXCL-add-force.patch b/package/util-linux/0003-blkdiscard-use-O_EXCL-add-force.patch
index 191608e080..0ecb867029 100644
--- a/package/util-linux/0003-blkdiscard-use-O_EXCL-add-force.patch
+++ b/package/util-linux/0003-blkdiscard-use-O_EXCL-add-force.patch
@@ -8,6 +8,7 @@ unwanted discard on mounted device.
 
 Addresses: https://github.com/karelzak/util-linux/issues/915
 Signed-off-by: Karel Zak <kzak@redhat.com>
+Signed-off-by: Carlos Santos <unixmania@gmail.com>
 ---
  sys-utils/blkdiscard.8 |  5 +++++
  sys-utils/blkdiscard.c | 11 ++++++++---
diff --git a/package/util-linux/0004-libfdisk-add-fdisk_set_disklabel_id_from_string.patch b/package/util-linux/0004-libfdisk-add-fdisk_set_disklabel_id_from_string.patch
index 40854e4b8d..eb28ae328b 100644
--- a/package/util-linux/0004-libfdisk-add-fdisk_set_disklabel_id_from_string.patch
+++ b/package/util-linux/0004-libfdisk-add-fdisk_set_disklabel_id_from_string.patch
@@ -8,6 +8,7 @@ It's not comfortable if you want to avoid dialog or template.
 
 Addresses: https://github.com/karelzak/util-linux/issues/916
 Signed-off-by: Karel Zak <kzak@redhat.com>
+Signed-off-by: Carlos Santos <unixmania@gmail.com>
 ---
  libfdisk/docs/libfdisk-sections.txt |  1 +
  libfdisk/src/dos.c                  | 29 ++++++++++++++++++-----------
diff --git a/package/util-linux/0005-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch b/package/util-linux/0005-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch
index cc96fbb1fa..fe435018f2 100644
--- a/package/util-linux/0005-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch
+++ b/package/util-linux/0005-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch
@@ -5,6 +5,7 @@ Subject: [PATCH] sfdisk: add --disk-id to change disk UUID/ID
 
 Addresses: https://github.com/karelzak/util-linux/issues/916
 Signed-off-by: Karel Zak <kzak@redhat.com>
+Signed-off-by: Carlos Santos <unixmania@gmail.com>
 ---
  disk-utils/sfdisk.8 |  5 +++++
  disk-utils/sfdisk.c | 54 +++++++++++++++++++++++++++++++++++++++++++++
-- 
2.18.2
