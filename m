From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Thu, 13 Aug 2015 16:10:32 +0200
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3.{2, 10, 12, 14,
	18}.x and 4.1.x series
Message-ID: <1439475033-13699-1-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
---
 package/linux-headers/Config.in.host | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index baf098a..61eca21 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -208,18 +208,18 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
-	default "3.2.69"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.70"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.108"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.85"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.86"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.45"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.46"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.49"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.50"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
-	default "3.18.19"	if BR2_KERNEL_HEADERS_3_18
+	default "3.18.20"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.4"		if BR2_KERNEL_HEADERS_4_1
+	default "4.1.5"		if BR2_KERNEL_HEADERS_4_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.1.4
