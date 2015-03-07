From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  7 Mar 2015 14:40:51 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3.{2, 10, 14, 18,
	19}.x series
Message-ID: <1425750052-13206-1-git-send-email-gustavo@zacarias.com.ar>
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
index e2bc05a..e6764e0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -190,16 +190,16 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
-	default "3.2.67"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.68"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.106"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.70"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.71"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.38"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.34"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.35"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
-	default "3.18.8"	if BR2_KERNEL_HEADERS_3_18
-	default "3.19"		if BR2_KERNEL_HEADERS_3_19
+	default "3.18.9"	if BR2_KERNEL_HEADERS_3_18
+	default "3.19.1"	if BR2_KERNEL_HEADERS_3_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.0.5
