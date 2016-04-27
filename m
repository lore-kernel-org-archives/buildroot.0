From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Apr 2016 14:25:41 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.{4, 12, 18}.x series
Message-ID: <1461777941-11055-1-git-send-email-gustavo@zacarias.com.ar>
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
index 7acbf61..2e01e3d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -211,11 +211,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.79"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.111"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.112"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.101"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.57"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.59"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.67"	if BR2_KERNEL_HEADERS_3_14
-	default "3.18.31"	if BR2_KERNEL_HEADERS_3_18
+	default "3.18.32"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.22"	if BR2_KERNEL_HEADERS_4_1
-- 
2.7.3
