From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 18 Mar 2015 14:34:03 -0700
Subject: [Buildroot] [PATCH] kernels: bump 3.10.x 3.14.x,
	3.19.x to new stable kernel releases
Message-ID: <1426714443-22832-1-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---
 linux/Config.in                      | 2 +-
 package/linux-headers/Config.in.host | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index af22ab4..f24d58e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -21,7 +21,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "3.19.1"
+	bool "3.19.2"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e6764e0..2d32168 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -192,14 +192,14 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.68"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.106"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.71"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.72"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.38"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.35"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.36"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.9"	if BR2_KERNEL_HEADERS_3_18
-	default "3.19.1"	if BR2_KERNEL_HEADERS_3_19
+	default "3.19.2"	if BR2_KERNEL_HEADERS_3_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.3.3
