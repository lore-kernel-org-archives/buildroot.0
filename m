From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 15 Sep 2016 12:16:38 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.{2, 14}.x and 4.4.x series
Message-ID: <1473952598-18326-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b686467..09e187b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -229,18 +229,18 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.81"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.82"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.112"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.103"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.63"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.77"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.79"	if BR2_KERNEL_HEADERS_3_14
 	default "3.18.41"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.32"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
-	default "4.4.19"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.21"	if BR2_KERNEL_HEADERS_4_4
 	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
 	default "4.6.7"		if BR2_KERNEL_HEADERS_4_6
 	default "4.7.4"		if BR2_KERNEL_HEADERS_4_7
-- 
2.7.3
