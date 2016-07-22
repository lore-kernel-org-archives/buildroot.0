From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 22 Jul 2016 20:35:52 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.12.x series
Message-ID: <1469230552-23409-1-git-send-email-gustavo@zacarias.com.ar>
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
index 5845f60..0df5d5d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -230,7 +230,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.81"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.112"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.102"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.61"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.62"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.73"	if BR2_KERNEL_HEADERS_3_14
 	default "3.18.37"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
-- 
2.7.3
