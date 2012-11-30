From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@openwide.fr>
Date: Fri, 30 Nov 2012 14:08:51 +0100
Subject: [Buildroot] [PATCH] [PATCH] reorder fs alphabetically
Message-ID: <1354280931-10379-1-git-send-email-jeremy.rosen@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
---
when adding the live target I was asked to add it in alphabetical order to
the fs list

however that list was unsorted. This patch reorders FS properly (it doesn't add the live fs)
---
 fs/Config.in |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/Config.in b/fs/Config.in
index 94154ea..e970075 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -4,12 +4,12 @@ source "fs/cramfs/Config.in"
 source "fs/cloop/Config.in"
 source "fs/ext2/Config.in"
 source "fs/jffs2/Config.in"
-source "fs/ubifs/Config.in"
-source "fs/squashfs/Config.in"
-source "fs/tar/Config.in"
 source "fs/cpio/Config.in"
-source "fs/iso9660/Config.in"
 source "fs/initramfs/Config.in"
+source "fs/iso9660/Config.in"
 source "fs/romfs/Config.in"
+source "fs/squashfs/Config.in"
+source "fs/tar/Config.in"
+source "fs/ubifs/Config.in"
 
 endmenu
-- 
1.7.10.4
