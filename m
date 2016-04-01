From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  1 Apr 2016 09:02:02 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.2.x series
Message-ID: <1459512122-29204-1-git-send-email-gustavo@zacarias.com.ar>
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
index 31c4d24..72cd5e1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -210,7 +210,7 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.78"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.79"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.111"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.101"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.56"	if BR2_KERNEL_HEADERS_3_12
-- 
2.7.3
