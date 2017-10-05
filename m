From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  5 Oct 2017 19:30:07 +0200
Subject: [Buildroot] [PATCH 2/2] linux: bump default to version 4.13.5
In-Reply-To: <20171005173007.15974-1-bernd.kuhls@t-online.de>
References: <20171005173007.15974-1-bernd.kuhls@t-online.de>
Message-ID: <20171005173007.15974-2-bernd.kuhls@t-online.de>
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
index e061a6a753..9614ee7acf 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -116,7 +116,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.13.4" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.13.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.83-cip8" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
-- 
2.11.0
