From: Fabio Estevam <festevam@gmail.com>
Date: Sun,  4 Mar 2018 11:53:20 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 4.9.x series
Message-ID: <1520175200-5717-1-git-send-email-festevam@gmail.com>
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
index 397068d..40c78ee 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -243,7 +243,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.99"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.49"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.119"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.85"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.86"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
-- 
2.7.4
