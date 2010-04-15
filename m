From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Apr 2010 13:51:33 +0200
Subject: [Buildroot] [git commit master] iso9660: menu.lst fixup after move
	to fs
Message-ID: <20100415115253.D932F20CC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=376549b7556f5df748a1fbf70b4bdd843458f78e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/iso9660/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index ceee52f..7830581 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -10,7 +10,7 @@ config BR2_TARGET_ROOTFS_ISO9660
 config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
 	string "Boot menu.lst file"
 	depends on BR2_TARGET_ROOTFS_ISO9660
-	default "target/iso9660/menu.lst"
+	default "fs/iso9660/menu.lst"
 
 comment "iso image requires a Linux kernel to be built"
 	depends on BR2_i386 && BR2_KERNEL_none
-- 
1.6.3.3
