From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 24 Aug 2018 20:41:31 +0200
Subject: [Buildroot] [PATCH/next 1/3] linux-headers: bump 4.{4, 9, 14, 17,
 18}.x series
Message-ID: <20180824184133.8508-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/linux-headers/Config.in.host | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index bd9c4827b3..8ee91c3076 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -266,15 +266,15 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.145"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.116"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.152"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.124"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.59"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.67"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
-	default "4.17.11"	if BR2_KERNEL_HEADERS_4_17
-	default "4.18.3"	if BR2_KERNEL_HEADERS_4_18
+	default "4.17.19"	if BR2_KERNEL_HEADERS_4_17
+	default "4.18.5"	if BR2_KERNEL_HEADERS_4_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.18.0
