From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Dec 2012 14:58:33 -0300
Subject: [Buildroot] [PATCH 2/2] linux: bump to 3.7.x version
In-Reply-To: <1355248713-4607-1-git-send-email-gustavo@zacarias.com.ar>
References: <1355248713-4607-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1355248713-4607-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 linux/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ef3b2a1..51810e2 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -20,8 +20,8 @@ if BR2_LINUX_KERNEL
 choice
 	prompt "Kernel version"
 
-config BR2_LINUX_KERNEL_3_6
-	bool "3.6.9"
+config BR2_LINUX_KERNEL_3_7
+	bool "3.7"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -76,7 +76,7 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "3.6.9" if BR2_LINUX_KERNEL_3_6
+	default "3.7" if BR2_LINUX_KERNEL_3_7
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
1.7.8.6
