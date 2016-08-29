From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 29 Aug 2016 10:21:05 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.10.x series
Message-ID: <1472476865-1939-1-git-send-email-gustavo@zacarias.com.ar>
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
index 14e86ab..f3a99e5 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -237,7 +237,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.81"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.112"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.102"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.103"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.62"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.77"	if BR2_KERNEL_HEADERS_3_14
 	default "3.18.40"	if BR2_KERNEL_HEADERS_3_18
-- 
2.7.3
