From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 16 Jan 2015 14:39:53 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3.{18, 14, 10}.x series
Message-ID: <1421429994-23163-1-git-send-email-gustavo@zacarias.com.ar>
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
index f4f80d1..33ab75f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -174,13 +174,13 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.66"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.105"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.64"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.65"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.36"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.28"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.29"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
-	default "3.18.2"	if BR2_KERNEL_HEADERS_3_18
+	default "3.18.3"	if BR2_KERNEL_HEADERS_3_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.0.5
