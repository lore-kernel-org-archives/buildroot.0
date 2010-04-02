From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Fri, 2 Apr 2010 11:44:57 -0500
Subject: [Buildroot] [PATCH] target/linux: bump 2.6.{27, 31, 32,
	33} stable versions
Message-ID: <0D753D10438DA54287A00B0270842697636A7E9941@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that the kernel-headers are bumped, also bump the linux
targets to match.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/target/linux/Config.in.advanced b/target/linux/Config.in.advanced
index 36f5374..2c5dc36 100644
--- a/target/linux/Config.in.advanced
+++ b/target/linux/Config.in.advanced
@@ -97,7 +97,7 @@ choice
 	  Select the specific Linux version you want to use
 
 config BR2_LINUX_2_6_STABLE
-	bool "The latest stable Linux kernel (2.6.33)"
+	bool "The latest stable Linux kernel (2.6.33.2)"
 
 config BR2_LINUX_2_6_33
 	bool "Linux 2.6.33"
diff --git a/target/linux/Config.in.versions b/target/linux/Config.in.versions
index f08b551..54a62d8 100644
--- a/target/linux/Config.in.versions
+++ b/target/linux/Config.in.versions
@@ -15,27 +15,27 @@ config LINUX26_LATEST_GIT_VERSION
 
 config BR2_KERNEL_CURRENT_VERSION
 	string
-	default "2.6.33"
+	default "2.6.33.2"
 	help
 	  This is the latest stable kernel (including minor version).
 
 config BR2_KERNEL_LATEST_2_6_33
 	string
-	default ""
+	default "2"
 	help
-	  Released 2010-Feb-24.
+	  Released 2010-Apr-01.
 
 config BR2_KERNEL_LATEST_2_6_32
 	string
-	default "9"
+	default "11"
 	help
-	  Released 2010-Feb-23.
+	  Released 2010-Apr-01.
 
 config BR2_KERNEL_LATEST_2_6_31
 	string
-	default "12"
+	default "13"
 	help
-	  Released 2010-Jan-18 (last .31-stable release).
+	  Released 2010-Apr-01 (last .31-stable release).
 
 config BR2_KERNEL_LATEST_2_6_30
 	string
@@ -57,6 +57,6 @@ config BR2_KERNEL_LATEST_2_6_28
 
 config BR2_KERNEL_LATEST_2_6_27
 	string
-	default "45"
+	default "46"
 	help
-	  Released 2010-Jan-28.
+	  Released 2010-Apr-01.
