From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  1 Sep 2015 07:25:36 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.{2, 10, 12,
	14}.x and 4.1.x series
Message-ID: <1441103136-26019-1-git-send-email-gustavo@zacarias.com.ar>
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
index 1ee3ef9..3a9603e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -216,19 +216,19 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
-	default "3.2.70"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.71"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.108"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.86"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.87"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.46"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.47"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.50"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.51"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.20"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.5"		if BR2_KERNEL_HEADERS_4_1
+	default "4.1.6"		if BR2_KERNEL_HEADERS_4_1
 	default "4.2"		if BR2_KERNEL_HEADERS_4_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.4.6
