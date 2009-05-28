From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 May 2009 16:14:48 +0200
Subject: [Buildroot] [git commit] linux-advanced: bump 2.6.29.x kernel
	version
Message-ID: <20090528141640.85A067781A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ee69b6b649b286734a0ab099d60244bc6f35f90
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Svein-Erik Skjelbred <at91rm9200@skjelbred.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/linux/Config.in.advanced |    2 +-
 target/linux/Config.in.versions |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/linux/Config.in.advanced b/target/linux/Config.in.advanced
index de54d03..3a171b5 100644
--- a/target/linux/Config.in.advanced
+++ b/target/linux/Config.in.advanced
@@ -128,7 +128,7 @@ choice
 	  Select the specific Linux version you want to use
 
 config BR2_LINUX_2_6_STABLE
-	bool "The latest stable Linux kernel (2.6.29.2)"
+	bool "The latest stable Linux kernel (2.6.29.4)"
 
 config BR2_LINUX_2_6_29
 	bool "Linux 2.6.29"
diff --git a/target/linux/Config.in.versions b/target/linux/Config.in.versions
index 467f73c..a37a5ad 100644
--- a/target/linux/Config.in.versions
+++ b/target/linux/Config.in.versions
@@ -19,13 +19,13 @@ config LINUX26_LATEST_MM_VERSION
 
 config BR2_KERNEL_CURRENT_VERSION
 	string
-	default "2.6.29.2"
+	default "2.6.29.4"
 	help
 	  This is the latest stable kernel (including minor version)
 
 config BR2_KERNEL_LATEST_2_6_29
 	string
-	default "2"
+	default "4"
 
 config BR2_KERNEL_LATEST_2_6_28
 	string
-- 
1.6.0.6
