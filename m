From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 24 Nov 2017 19:15:37 +0100
Subject: [Buildroot] [PATCH 2/2] linux: bump default to version 4.13.16
In-Reply-To: <20171124181537.31222-1-bernd.kuhls@t-online.de>
References: <20171124181537.31222-1-bernd.kuhls@t-online.de>
Message-ID: <20171124181537.31222-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 5c448f26bb..41f039e2ca 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -116,7 +116,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.13.15" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.13.16" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.83-cip8" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
-- 
2.11.0
