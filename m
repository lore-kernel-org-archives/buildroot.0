From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Jan 2015 09:59:05 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.2.x series
Message-ID: <1420203545-29094-1-git-send-email-gustavo@zacarias.com.ar>
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
index 35c88e4..ed994c1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -172,7 +172,7 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
-	default "3.2.65"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.66"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.105"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.63"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-- 
2.0.5
