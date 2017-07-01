From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  1 Jul 2017 10:14:14 +0200
Subject: [Buildroot] [PATCH 1/1] linux-headers: bump 4.1.x series
Message-ID: <20170701081414.14160-1-bernd.kuhls@t-online.de>
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
index 613a26ea5..e5c0109a1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -226,7 +226,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.106"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
-	default "4.1.41"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.42"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.74"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.34"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
-- 
2.11.0
