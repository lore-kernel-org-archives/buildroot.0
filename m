From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Oct 2016 07:36:50 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.{4, 18}.x and 4.1.x series
Message-ID: <1477564610-29283-1-git-send-email-gustavo@zacarias.com.ar>
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
index 47ef25d..37936f6 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -224,14 +224,14 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.83"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.112"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.104"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.66"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.79"	if BR2_KERNEL_HEADERS_3_14
-	default "3.18.43"	if BR2_KERNEL_HEADERS_3_18
+	default "3.18.44"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.34"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.35"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.27"	if BR2_KERNEL_HEADERS_4_4
 	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
 	default "4.6.7"		if BR2_KERNEL_HEADERS_4_6
-- 
2.7.3
