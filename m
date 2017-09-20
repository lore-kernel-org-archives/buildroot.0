From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 20 Sep 2017 09:53:41 +0200
Subject: [Buildroot] [PATCH v2 2/2] linux: bump default to version 4.13.3
In-Reply-To: <20170920075341.4610-1-bernd.kuhls@t-online.de>
References: <20170920075341.4610-1-bernd.kuhls@t-online.de>
Message-ID: <20170920075341.4610-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: bump to 4.13.3

 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 62a4f1e31a..ae4ae3c89f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -116,7 +116,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.13.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.13.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.83-cip8" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
-- 
2.11.0
