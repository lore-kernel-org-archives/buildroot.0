From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 18 Feb 2016 09:53:20 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3.{2, 12, 14,
	18}.x and 4.{1, 4}.x series
Message-ID: <1455800001-18956-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ad5ee2e..bdf99f5 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -207,17 +207,17 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.76"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.77"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.110"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.96"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.53"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.60"	if BR2_KERNEL_HEADERS_3_14
+	default "3.12.54"	if BR2_KERNEL_HEADERS_3_12
+	default "3.14.61"	if BR2_KERNEL_HEADERS_3_14
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
-	default "3.18.26"	if BR2_KERNEL_HEADERS_3_18
+	default "3.18.27"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.17"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.18"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
 	default "4.3.5"		if BR2_KERNEL_HEADERS_4_3
-	default "4.4.1"		if BR2_KERNEL_HEADERS_4_4
+	default "4.4.2"		if BR2_KERNEL_HEADERS_4_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.4.10
