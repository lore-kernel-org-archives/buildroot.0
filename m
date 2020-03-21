From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Mar 2020 21:02:45 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/util-linux: add
 missing SOB to patches
Message-ID: <20200321195457.AEF1583B01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a17e2522cf97e2da84a43c643455d0aa0f490421
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

It is required that all patches in packages have the Signed-off-by of
the contributor who brought them into Buildroot.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 94784f092b021af29b9480b66cd167d175b0f16b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/0003-blkdiscard-use-O_EXCL-add-force.patch            | 1 +
 .../0004-libfdisk-add-fdisk_set_disklabel_id_from_string.patch           | 1 +
 package/util-linux/0005-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch  | 1 +
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
