From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  1 Feb 2016 11:51:08 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 4.{1, 3, 4}.x series
Message-ID: <1454338268-29537-1-git-send-email-gustavo@zacarias.com.ar>
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
index bdc7ef0..e556bbf 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -211,8 +211,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.18.26"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.16"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.17"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
-	default "4.3.4"		if BR2_KERNEL_HEADERS_4_3
-	default "4.4"		if BR2_KERNEL_HEADERS_4_4
+	default "4.3.5"		if BR2_KERNEL_HEADERS_4_3
+	default "4.4.1"		if BR2_KERNEL_HEADERS_4_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.4.10
