From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 14 Aug 2014 08:14:56 -0300
Subject: [Buildroot] [PATCHv2 1/2] linux-headers: bump 3.{4, 10, 14, 15,
	16}.x series
Message-ID: <1408014897-1339-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6957a51..1f2094a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -157,13 +157,13 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.62"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.102"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.103"	if BR2_KERNEL_HEADERS_3_4
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.52"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.53"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.26"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.16"	if BR2_KERNEL_HEADERS_3_14
-	default "3.15.9"	if BR2_KERNEL_HEADERS_3_15
-	default "3.16"		if BR2_KERNEL_HEADERS_3_16
+	default "3.14.17"	if BR2_KERNEL_HEADERS_3_14
+	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
+	default "3.16.1"	if BR2_KERNEL_HEADERS_3_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.8.5.5
