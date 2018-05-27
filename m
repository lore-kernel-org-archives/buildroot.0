From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 27 May 2018 09:40:21 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 4.4.x series
Message-ID: <1527424821-9147-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6288811..74ea33c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -250,7 +250,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.101"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.51"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.131"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.133"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.103"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
-- 
2.7.4
