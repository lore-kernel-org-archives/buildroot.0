From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 17 Apr 2015 13:07:48 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.4.x series
Message-ID: <1429286868-16238-1-git-send-email-gustavo@zacarias.com.ar>
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
index de14fd5..49f818b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -199,7 +199,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.68"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.106"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.107"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.74"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.40"	if BR2_KERNEL_HEADERS_3_12
-- 
2.0.5
