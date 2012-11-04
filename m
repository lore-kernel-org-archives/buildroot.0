From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Nov 2012 13:00:25 +0100
Subject: [Buildroot] [git commit] system: fixup default device table
	locations after system/ got added
Message-ID: <20121104120256.5C19399A72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d8dd5ee62ed1b6fb04cbc51c0073b2e4815c205
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 system/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index c30c6f7..10c9d9d 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -71,7 +71,7 @@ endchoice
 
 config BR2_ROOTFS_DEVICE_TABLE
 	string "Path to the permission tables"
-	default "target/generic/device_table.txt"
+	default "system/device_table.txt"
 	help
 	  Specify a space-separated list of permission table locations,
 	  that will be passed to the makedevs utility to assign
@@ -83,7 +83,7 @@ config BR2_ROOTFS_DEVICE_TABLE
 
 config BR2_ROOTFS_STATIC_DEVICE_TABLE
 	string "Path to the device tables"
-	default "target/generic/device_table_dev.txt"
+	default "system/device_table_dev.txt"
 	depends on BR2_ROOTFS_DEVICE_CREATION_STATIC
 	help
 	  Specify a space-separated list of device table locations,
