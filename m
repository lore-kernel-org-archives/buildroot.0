From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 20 Aug 2016 13:49:17 -0300
Subject: [Buildroot] [PATCH 2/2] linux: bump defaut to version 4.7.2
In-Reply-To: <1471711757-506-1-git-send-email-gustavo@zacarias.com.ar>
References: <1471711757-506-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1471711757-506-2-git-send-email-gustavo@zacarias.com.ar>
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
index 292e7d5..c7bc4d8 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -26,7 +26,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.7.1)"
+	bool "Latest version (4.7.2)"
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION
 	bool "Custom version"
@@ -109,7 +109,7 @@ config BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.7.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.7.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
2.7.3
