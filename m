From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  6 Aug 2017 15:28:41 +0200
Subject: [Buildroot] [PATCH 1/1] linux-headers: bump 4.1.x series
Message-ID: <20170806132841.29475-1-bernd.kuhls@t-online.de>
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
index 90c93bacd..6f11fcca6 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -235,7 +235,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.106"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
-	default "4.1.42"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.43"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.79"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.40"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
-- 
2.11.0
