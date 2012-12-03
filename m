From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@openwide.fr>
Date: Mon,  3 Dec 2012 11:21:49 +0100
Subject: [Buildroot] [PATCH] reorder fs alphabetically
In-Reply-To: <1354003953-10875-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1354003953-10875-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <1354530109-13231-1-git-send-email-jeremy.rosen@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
---
 fs/Config.in |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/Config.in b/fs/Config.in
index 94154ea..da4c5ff 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -1,15 +1,15 @@
 menu "Filesystem images"
 
-source "fs/cramfs/Config.in"
 source "fs/cloop/Config.in"
+source "fs/cpio/Config.in"
+source "fs/cramfs/Config.in"
 source "fs/ext2/Config.in"
+source "fs/initramfs/Config.in"
+source "fs/iso9660/Config.in"
 source "fs/jffs2/Config.in"
-source "fs/ubifs/Config.in"
+source "fs/romfs/Config.in"
 source "fs/squashfs/Config.in"
 source "fs/tar/Config.in"
-source "fs/cpio/Config.in"
-source "fs/iso9660/Config.in"
-source "fs/initramfs/Config.in"
-source "fs/romfs/Config.in"
+source "fs/ubifs/Config.in"
 
 endmenu
-- 
1.7.10.4
