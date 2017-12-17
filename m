From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 17 Dec 2017 13:24:25 -0200
Subject: [Buildroot] [PATCH 1/2] linux: bump default to version 4.14.7
Message-ID: <1513524266-32758-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 8acd00e..735b25e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -116,7 +116,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.14.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.14.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.105-cip15" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
-- 
2.7.4
