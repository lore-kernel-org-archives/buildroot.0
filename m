From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Tue, 23 Feb 2010 15:55:50 -0700
Subject: [Buildroot] [PATCH] bump linux kernel versions
Message-ID: <201002231555.50237.hartleys@visionengravers.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump all the linux kernel version to the latest available and add a
help note for all of them with the release data and status.

The long-term stable 2.6.27 kernel is really out of date (.27 -> .45).

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/target/linux/Config.in.advanced b/target/linux/Config.in.advanced
index f87d710..6fb39b3 100644
--- a/target/linux/Config.in.advanced
+++ b/target/linux/Config.in.advanced
@@ -126,7 +126,7 @@ choice
 	  Select the specific Linux version you want to use
 
 config BR2_LINUX_2_6_STABLE
-	bool "The latest stable Linux kernel (2.6.32.8)"
+	bool "The latest stable Linux kernel (2.6.32.9)"
 
 config BR2_LINUX_2_6_32
 	bool "Linux 2.6.32"
diff --git a/target/linux/Config.in.versions b/target/linux/Config.in.versions
index 1d4cd75..7526bf6 100644
--- a/target/linux/Config.in.versions
+++ b/target/linux/Config.in.versions
@@ -19,42 +19,60 @@ config LINUX26_LATEST_MM_VERSION
 
 config BR2_KERNEL_CURRENT_VERSION
 	string
-	default "2.6.32.8"
+	default "2.6.32.9"
 	help
-	  This is the latest stable kernel (including minor version)
+	  This is the latest stable kernel (including minor version).
 
 config BR2_KERNEL_LATEST_2_6_32
 	string
-	default "8"
+	default "9"
+	help
+	  Released 2010-Feb-23.
 
 config BR2_KERNEL_LATEST_2_6_31
 	string
 	default "12"
+	help
+	  Released 2010-Jan-18 (last .31-stable release).
 
 config BR2_KERNEL_LATEST_2_6_30
 	string
-	default "2"
+	default "10"
+	help
+	  Released 2009-Dec-04 (last .30-stable release).
 
 config BR2_KERNEL_LATEST_2_6_29
 	string
 	default "6"
+	help
+	  Released 2009-Jul-02 (last .29-stable release).
 
 config BR2_KERNEL_LATEST_2_6_28
 	string
 	default "10"
+	help
+	  Released 2009-May-02 (last .28-stable release).
 
 config BR2_KERNEL_LATEST_2_6_27
 	string
-	default "27"
+	default "45"
+	help
+	  Released 2010-Jan-28.
 
 config BR2_KERNEL_LATEST_2_6_26
 	string
 	default "8"
+	help
+	  Released 2008-Nov-10 (last .26-stable release).
 
 config BR2_KERNEL_LATEST_2_6_25
 	string
-	default "19"
+	default "20"
+	help
+	  Released 2008-Nov-10.
 
 config BR2_KERNEL_LATEST_2_6_24
 	string
 	default "7"
+	help
+	  Released 2008-May-07.
