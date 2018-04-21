From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Apr 2018 10:49:58 +0200
Subject: [Buildroot] [PATCH 1/1] linux-headers: bump 4.9.x series
Message-ID: <20180421084958.28153-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9d32687c0e..68ac47cebe 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -251,7 +251,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.101"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.51"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.128"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.94"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.95"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
-- 
2.14.2
