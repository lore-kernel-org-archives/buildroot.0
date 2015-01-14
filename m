From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Jan 2015 15:01:49 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.12.x series
Message-ID: <1421258509-20091-1-git-send-email-gustavo@zacarias.com.ar>
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
index 23bb201..f4f80d1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -176,7 +176,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.105"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.64"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.35"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.36"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
 	default "3.14.28"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
-- 
2.0.5
