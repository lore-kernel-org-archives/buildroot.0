From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  6 Sep 2014 08:47:46 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3.{10, 12, 14,
	16}.x series
Message-ID: <1410004067-9669-1-git-send-email-gustavo@zacarias.com.ar>
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
index b2554ab..f7df881 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -163,11 +163,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.62"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.103"	if BR2_KERNEL_HEADERS_3_4
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.53"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.54"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.26"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.27"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.17"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.18"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
-	default "3.16.1"	if BR2_KERNEL_HEADERS_3_16
+	default "3.16.2"	if BR2_KERNEL_HEADERS_3_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.8.5.5
