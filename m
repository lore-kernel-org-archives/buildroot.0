From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 18 Jun 2012 08:16:38 -0300
Subject: [Buildroot] [PATCH 2/2] linux: bump default to kernel version 3.4.3
In-Reply-To: <1340018198-2905-1-git-send-email-gustavo@zacarias.com.ar>
References: <1340018198-2905-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1340018198-2905-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 linux/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 26e0872..1cd05ae 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -22,7 +22,7 @@ choice
 	default BR2_LINUX_KERNEL_3_4
 
 config BR2_LINUX_KERNEL_3_4
-	bool "3.4.2"
+	bool "3.4.3"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -77,7 +77,7 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "3.4.2" if BR2_LINUX_KERNEL_3_4
+	default "3.4.3" if BR2_LINUX_KERNEL_3_4
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
1.7.3.4
