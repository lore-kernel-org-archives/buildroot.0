From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 23 Feb 2014 08:43:20 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3.{4, 10, 12,
	13}.x stable versions
Message-ID: <1393155801-29030-1-git-send-email-gustavo@zacarias.com.ar>
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
index c99210d..134e338 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -72,14 +72,14 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.55"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.80"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.82"	if BR2_KERNEL_HEADERS_3_4
 	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
 	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.30"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.32"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.11"	if BR2_KERNEL_HEADERS_3_12
-	default "3.13.3"	if BR2_KERNEL_HEADERS_3_13
+	default "3.12.13"	if BR2_KERNEL_HEADERS_3_12
+	default "3.13.5"	if BR2_KERNEL_HEADERS_3_13
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.8.3.2
