From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 Dec 2012 23:19:25 -0800
Subject: [Buildroot] [git commit] reorder fs alphabetically
Message-ID: <20121203145717.8E98281E08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d1692abc007d2c50568e885d7ab6a312e3f8ae1e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??r??my Rosen <jeremy.rosen@openwide.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/Config.in |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

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
