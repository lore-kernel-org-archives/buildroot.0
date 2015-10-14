From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Oct 2015 11:11:05 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.2.x series
Message-ID: <1444831865-16552-1-git-send-email-gustavo@zacarias.com.ar>
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
index adcf616..7001466 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -191,7 +191,7 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.71"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.72"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.109"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.90"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.49"	if BR2_KERNEL_HEADERS_3_12
-- 
2.4.9
