From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 20 Sep 2017 09:53:40 +0200
Subject: [Buildroot] [PATCH v2 1/2] linux-headers: bump 3.2.x and 4.{4, 9, 12,
	13}.x series
Message-ID: <20170920075341.4610-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: bump to 4.9.51, 4.12.14, 4.13.3

 package/linux-headers/Config.in.host | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d30dea0457..8bd3c07007 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -239,15 +239,15 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.92"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.93"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.107"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.43"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.87"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.49"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.88"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.51"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
-	default "4.12.12"	if BR2_KERNEL_HEADERS_4_12
-	default "4.13.1"	if BR2_KERNEL_HEADERS_4_13
+	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
+	default "4.13.3"	if BR2_KERNEL_HEADERS_4_13
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.11.0
