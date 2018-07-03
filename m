From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Tue,  3 Jul 2018 10:11:58 -0300
Subject: [Buildroot] [PATCH 1/4] linux: bump default to version 4.17.4
Message-ID: <1530623521-11432-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <festevam@gmail.com>

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index a25e021..d3ea344 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -120,7 +120,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.17.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.17.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.130-cip23" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
-- 
2.7.4
