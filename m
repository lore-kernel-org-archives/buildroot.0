From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Jun 2012 16:40:35 -0300
Subject: [Buildroot] [PATCH 2/2] linux: bump default to kernel version 3.4.1
In-Reply-To: <1338838835-6352-1-git-send-email-gustavo@zacarias.com.ar>
References: <1338838835-6352-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1338838835-6352-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 linux/Config.in |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 4562b1b..83dac3f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -19,10 +19,10 @@ if BR2_LINUX_KERNEL
 #
 choice
 	prompt "Kernel version"
-	default BR2_LINUX_KERNEL_3_3
+	default BR2_LINUX_KERNEL_3_4
 
-config BR2_LINUX_KERNEL_3_3
-	bool "3.3.7"
+config BR2_LINUX_KERNEL_3_4
+	bool "3.4.1"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -77,7 +77,7 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "3.3.7" if BR2_LINUX_KERNEL_3_3
+	default "3.4.1" if BR2_LINUX_KERNEL_3_4
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
1.7.3.4
