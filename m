From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 11 May 2016 17:06:09 -0300
Subject: [Buildroot] [PATCH v3] linux: Bump default to version 4.5.4
Message-ID: <1462997169-7237-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
Changes since v2:
- Resent from my gmail account as my other email is not subscribed to the list
Changes since v1:
- Fix Subject to 4.5.4

 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 306405b..ff62bcf 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -27,7 +27,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.5.3)"
+	bool "Latest version (4.5.4)"
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION
 	bool "Custom version"
@@ -110,7 +110,7 @@ config BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.5.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.5.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
1.9.1
