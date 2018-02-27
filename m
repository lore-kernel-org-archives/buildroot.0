From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 27 Feb 2018 20:10:34 +0100
Subject: [Buildroot] [PATCH 1/1] linux-headers: bump 3.2.x series
Message-ID: <20180227191034.9507-1-bernd.kuhls@t-online.de>
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
index bc1e98a994..6de3660b38 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -240,7 +240,7 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.98"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.99"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.49"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.118"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.84"	if BR2_KERNEL_HEADERS_4_9
-- 
2.11.0
