From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Wed, 12 May 2010 20:01:27 -0500
Subject: [Buildroot] [PATCH] target/linux: bump 2.6.32 and 2.6.33 versions
Message-ID: <0D753D10438DA54287A00B0270842697636EF69BC5@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New versions of the 2.6.32 and 2.6.33 kernel were released today
and it is suggested that all users should upgrade.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/target/linux/Config.in.advanced b/target/linux/Config.in.advanced
index b0022d3..d6c8559 100644
--- a/target/linux/Config.in.advanced
+++ b/target/linux/Config.in.advanced
@@ -97,7 +97,7 @@ choice
 	  Select the specific Linux version you want to use
 
 config BR2_LINUX_2_6_STABLE
-	bool "The latest stable Linux kernel (2.6.33.2)"
+	bool "The latest stable Linux kernel (2.6.33.4)"
 
 config BR2_LINUX_2_6_33
 	bool "Linux 2.6.33"
diff --git a/target/linux/Config.in.versions b/target/linux/Config.in.versions
index 54a62d8..c5263a4 100644
--- a/target/linux/Config.in.versions
+++ b/target/linux/Config.in.versions
@@ -15,21 +15,21 @@ config LINUX26_LATEST_GIT_VERSION
 
 config BR2_KERNEL_CURRENT_VERSION
 	string
-	default "2.6.33.2"
+	default "2.6.33.4"
 	help
 	  This is the latest stable kernel (including minor version).
 
 config BR2_KERNEL_LATEST_2_6_33
 	string
-	default "2"
+	default "4"
 	help
-	  Released 2010-Apr-01.
+	  Released 2010-May-12.
 
 config BR2_KERNEL_LATEST_2_6_32
 	string
-	default "11"
+	default "13"
 	help
-	  Released 2010-Apr-01.
+	  Released 2010-May-12.
 
 config BR2_KERNEL_LATEST_2_6_31
 	string
