From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 23 Nov 2017 22:10:47 +0100
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 4.{4, 9, 13}.x series
Message-ID: <20171123211048.23370-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5cbcbfc9fb..3091100a29 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -244,10 +244,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.107"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.45"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.98"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.62"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.100"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.64"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
-	default "4.13.13"	if BR2_KERNEL_HEADERS_4_13
+	default "4.13.15"	if BR2_KERNEL_HEADERS_4_13
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.11.0
