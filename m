From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 30 Sep 2014 20:12:36 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.12.x series
Message-ID: <1412118756-1042-1-git-send-email-gustavo@zacarias.com.ar>
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
index df15877..9dd1eef 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -165,7 +165,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
 	default "3.10.55"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.28"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.29"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
 	default "3.14.19"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
-- 
2.0.4
