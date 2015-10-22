From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 22 Oct 2015 09:28:01 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.4.x series
Message-ID: <1445516881-3346-1-git-send-email-gustavo@zacarias.com.ar>
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
index 7001466..e05cef9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -192,7 +192,7 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.72"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.109"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.110"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.90"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.49"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.54"	if BR2_KERNEL_HEADERS_3_14
-- 
2.4.10
