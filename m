From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Jan 2013 07:46:03 -0300
Subject: [Buildroot] [PATCH 2/2] linux: bump 3.7.x stable version
In-Reply-To: <1358851563-3813-1-git-send-email-gustavo@zacarias.com.ar>
References: <1358851563-3813-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1358851563-3813-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 056b349..175a999 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -21,7 +21,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_3_7
-	bool "3.7.3"
+	bool "3.7.4"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -76,7 +76,7 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "3.7.3" if BR2_LINUX_KERNEL_3_7
+	default "3.7.4" if BR2_LINUX_KERNEL_3_7
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
1.7.12.4
