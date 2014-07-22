From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Jul 2014 16:06:30 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.12.x series
Message-ID: <1406055990-29600-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9cacf7b..edc1453 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -153,7 +153,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
 	default "3.10.49"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.24"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.25"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
 	default "3.14.13"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.6"	if BR2_KERNEL_HEADERS_3_15
-- 
1.8.5.5
