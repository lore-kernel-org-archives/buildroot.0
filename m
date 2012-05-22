From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 May 2012 11:56:30 -0300
Subject: [Buildroot] [PATCH 2/3] linux: bump default to kernel version 3.3.7
In-Reply-To: <1337698591-22898-1-git-send-email-gustavo@zacarias.com.ar>
References: <1337698591-22898-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1337698591-22898-2-git-send-email-gustavo@zacarias.com.ar>
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
index dd34465..4562b1b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -22,7 +22,7 @@ choice
 	default BR2_LINUX_KERNEL_3_3
 
 config BR2_LINUX_KERNEL_3_3
-	bool "3.3.6"
+	bool "3.3.7"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -77,7 +77,7 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "3.3.6" if BR2_LINUX_KERNEL_3_3
+	default "3.3.7" if BR2_LINUX_KERNEL_3_3
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
1.7.3.4
