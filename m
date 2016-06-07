From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 23:13:09 +0200
Subject: [Buildroot] [git commit] uboot-tools: fix minor typo in Config.in
	file
Message-ID: <20160607211325.02657807E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71514dac87b60ec74ea1b0378941605a23aed1f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uboot-tools/Config.in      | 2 +-
 package/uboot-tools/Config.in.host | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index c663230..88d6225 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT
 	help
 	  Enables support for Flattened Image Tree (FIT).
 
-	  This option allows to boot the new uImage structrure,
+	  This option allows to boot the new uImage structure,
 	  Flattened Image Tree. FIT is formally a FDT, which can include
 	  images of various types (kernel, FDT blob, ramdisk, etc.)
 	  in a single blob. To boot this new uImage structure,
diff --git a/package/uboot-tools/Config.in.host b/package/uboot-tools/Config.in.host
index 406d9ff..52a4c2e 100644
--- a/package/uboot-tools/Config.in.host
+++ b/package/uboot-tools/Config.in.host
@@ -13,7 +13,7 @@ config BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT
 	help
 	  Enables support for Flattened Image Tree (FIT).
 
-	  This option allows to boot the new uImage structrure,
+	  This option allows to boot the new uImage structure,
 	  Flattened Image Tree. FIT is formally a FDT, which can include
 	  images of various types (kernel, FDT blob, ramdisk, etc.)
 	  in a single blob. To boot this new uImage structure,
