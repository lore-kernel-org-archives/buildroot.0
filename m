From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  9 Aug 2016 23:26:12 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.18.x and 4.1.x series
Message-ID: <1470795972-19542-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ae5cc5d..7325d95 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -240,10 +240,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.102"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.62"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.74"	if BR2_KERNEL_HEADERS_3_14
-	default "3.18.38"	if BR2_KERNEL_HEADERS_3_18
+	default "3.18.39"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.29"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.30"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
 	default "4.4.16"	if BR2_KERNEL_HEADERS_4_4
-- 
2.7.3
