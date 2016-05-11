From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 May 2016 14:04:04 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.{14, 18}.x and 4.{1, 4,
	5}.x series
Message-ID: <1462986244-22602-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 04d5890..7c080d6 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -214,13 +214,13 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.112"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.101"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.59"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.68"	if BR2_KERNEL_HEADERS_3_14
-	default "3.18.32"	if BR2_KERNEL_HEADERS_3_18
+	default "3.14.69"	if BR2_KERNEL_HEADERS_3_14
+	default "3.18.33"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.23"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.24"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
-	default "4.4.9"		if BR2_KERNEL_HEADERS_4_4
-	default "4.5.3"		if BR2_KERNEL_HEADERS_4_5
+	default "4.4.10"	if BR2_KERNEL_HEADERS_4_4
+	default "4.5.4"		if BR2_KERNEL_HEADERS_4_5
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.3
