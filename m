From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 19 Oct 2017 19:34:02 +0200
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 4.{1, 4, 9, 13}.x series
Message-ID: <20171019173403.13792-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6421b217a7..26f3fd9922 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -243,11 +243,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.107"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
-	default "4.1.43"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.92"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.56"	if BR2_KERNEL_HEADERS_4_9
+	default "4.1.45"	if BR2_KERNEL_HEADERS_4_1
+	default "4.4.93"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.57"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
-	default "4.13.7"	if BR2_KERNEL_HEADERS_4_13
+	default "4.13.8"	if BR2_KERNEL_HEADERS_4_13
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.11.0
