From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 29 Aug 2018 19:21:11 +0200
Subject: [Buildroot] [PATCH 1/1] linux-headers: bump 4.4.x series
Message-ID: <20180829172111.23310-1-bernd.kuhls@t-online.de>
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
index 9f31bad9c3..065ea174db 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -266,7 +266,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.152"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.153"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.124"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
-- 
2.18.0
