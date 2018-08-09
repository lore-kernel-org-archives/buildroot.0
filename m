From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  9 Aug 2018 21:40:47 +0200
Subject: [Buildroot] [PATCH 2/2] linux: bump default to version 4.17.14
In-Reply-To: <20180809194047.22535-1-bernd.kuhls@t-online.de>
References: <20180809194047.22535-1-bernd.kuhls@t-online.de>
Message-ID: <20180809194047.22535-2-bernd.kuhls@t-online.de>
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
index 4f31850ac0..5f2a6d738c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -120,7 +120,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.17.13" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.17.14" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.138-cip25" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
-- 
2.18.0
