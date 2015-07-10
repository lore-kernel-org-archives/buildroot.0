From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 10 Jul 2015 15:10:04 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3.{10, 14,
	18}.x and 4.{0, 1}.x series
Message-ID: <1436551805-32402-1-git-send-email-gustavo@zacarias.com.ar>
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
index 9846f37..ec6e64d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -209,16 +209,16 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.69"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.108"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.83"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.84"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.44"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.47"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.48"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
-	default "3.18.17"	if BR2_KERNEL_HEADERS_3_18
+	default "3.18.18"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
-	default "4.0.7"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.1"		if BR2_KERNEL_HEADERS_4_1
+	default "4.0.8"		if BR2_KERNEL_HEADERS_4_0
+	default "4.1.2"		if BR2_KERNEL_HEADERS_4_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.3.6
