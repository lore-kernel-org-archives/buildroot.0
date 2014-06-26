From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 17:01:43 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3.{4, 10, 14,
	15}.x series
Message-ID: <1403812904-11302-1-git-send-email-gustavo@zacarias.com.ar>
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
index 1665aad..3d2094a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -149,12 +149,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.60"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.94"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.95"	if BR2_KERNEL_HEADERS_3_4
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.44"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.45"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.23"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.8"	if BR2_KERNEL_HEADERS_3_14
-	default "3.15.1"	if BR2_KERNEL_HEADERS_3_15
+	default "3.14.9"	if BR2_KERNEL_HEADERS_3_14
+	default "3.15.2"	if BR2_KERNEL_HEADERS_3_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.8.5.5
