From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  9 Jun 2014 18:15:31 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.2.x series
Message-ID: <1402348531-27886-1-git-send-email-gustavo@zacarias.com.ar>
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
index 8b55954..82778cc 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -153,7 +153,7 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
-	default "3.2.59"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.60"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.92"	if BR2_KERNEL_HEADERS_3_4
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-- 
1.8.5.5
