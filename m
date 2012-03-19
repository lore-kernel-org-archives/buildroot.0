From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 19 Mar 2012 07:21:49 -0300
Subject: [Buildroot] [PATCH 2/2] linux: add 3.3.x stable version
In-Reply-To: <1332152509-26953-1-git-send-email-gustavo@zacarias.com.ar>
References: <1332152509-26953-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1332152509-26953-2-git-send-email-gustavo@zacarias.com.ar>
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
index a7fa89f..6510a56 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -19,10 +19,10 @@ if BR2_LINUX_KERNEL
 #
 choice
 	prompt "Kernel version"
-	default BR2_LINUX_KERNEL_3_2
+	default BR2_LINUX_KERNEL_3_3
 
-config BR2_LINUX_KERNEL_3_2
-	bool "3.2.10"
+config BR2_LINUX_KERNEL_3_3
+	bool "3.3"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -73,7 +73,7 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "3.2.10" if BR2_LINUX_KERNEL_3_2
+	default "3.3" if BR2_LINUX_KERNEL_3_3
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
1.7.3.4
