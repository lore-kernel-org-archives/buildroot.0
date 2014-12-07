From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  7 Dec 2014 20:09:03 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3.{17, 14, 12,
	10}.x series
Message-ID: <1417993744-10058-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 516cd03..85ffde5 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -166,12 +166,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.64"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.105"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.61"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.62"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.33"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.34"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.25"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.26"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
-	default "3.17.4"	if BR2_KERNEL_HEADERS_3_17
+	default "3.17.6"	if BR2_KERNEL_HEADERS_3_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.0.4
