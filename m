From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 10 Dec 2017 12:44:27 -0200
Subject: [Buildroot] [PATCH 1/2] linux: bump default to version 4.14.5
Message-ID: <1512917068-7325-1-git-send-email-festevam@gmail.com>
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
index 5af5e4f..7a5f992 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -116,7 +116,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.14.4" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.14.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.98-cip13" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
-- 
2.7.4
