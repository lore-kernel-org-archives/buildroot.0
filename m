From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Sep 2014 15:23:17 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3.{16, 14, 10}.x series
Message-ID: <1410978198-23567-1-git-send-email-gustavo@zacarias.com.ar>
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
index c0ddf3e..ce65f7b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -163,11 +163,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.63"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.103"	if BR2_KERNEL_HEADERS_3_4
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.54"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.55"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.28"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.18"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.19"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
-	default "3.16.2"	if BR2_KERNEL_HEADERS_3_16
+	default "3.16.3"	if BR2_KERNEL_HEADERS_3_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.8.5.5
