From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 22 Oct 2016 09:08:31 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3.{2, 10, 12}.x and 4.{4,
	7, 8}.x series
Message-ID: <1477138112-12983-1-git-send-email-gustavo@zacarias.com.ar>
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
index d1e2ecf..ae2a3cd 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -223,18 +223,18 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.82"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.83"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.112"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.103"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.65"	if BR2_KERNEL_HEADERS_3_12
+	default "3.10.104"	if BR2_KERNEL_HEADERS_3_10
+	default "3.12.66"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.79"	if BR2_KERNEL_HEADERS_3_14
 	default "3.18.43"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.34"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.26"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.27"	if BR2_KERNEL_HEADERS_4_4
 	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
 	default "4.6.7"		if BR2_KERNEL_HEADERS_4_6
-	default "4.7.9"		if BR2_KERNEL_HEADERS_4_7
-	default "4.8.3"		if BR2_KERNEL_HEADERS_4_8
+	default "4.7.10"	if BR2_KERNEL_HEADERS_4_7
+	default "4.8.4"		if BR2_KERNEL_HEADERS_4_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.3
