From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  8 Jun 2016 07:29:20 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3.{18, 14}.x and 4.{1, 4,
	5, 6}.x series
Message-ID: <1465381761-26435-1-git-send-email-gustavo@zacarias.com.ar>
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
index d53766b..eed8d6a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -222,14 +222,14 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.112"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.101"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.60"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.71"	if BR2_KERNEL_HEADERS_3_14
-	default "3.18.34"	if BR2_KERNEL_HEADERS_3_18
+	default "3.14.72"	if BR2_KERNEL_HEADERS_3_14
+	default "3.18.35"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.25"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.26"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
-	default "4.4.12"	if BR2_KERNEL_HEADERS_4_4
-	default "4.5.6"		if BR2_KERNEL_HEADERS_4_5
-	default "4.6.1"		if BR2_KERNEL_HEADERS_4_6
+	default "4.4.13"	if BR2_KERNEL_HEADERS_4_4
+	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
+	default "4.6.2"		if BR2_KERNEL_HEADERS_4_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.3
