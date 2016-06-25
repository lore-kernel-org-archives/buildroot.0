From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Jun 2016 10:06:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/linux-headers: bump 3.{18,
	14}.x and 4.{1, 4, 6}.x series
Message-ID: <1466842001-11118-1-git-send-email-bernd.kuhls@t-online.de>
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
index 7162e21..af29676 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -222,14 +222,14 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.112"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.102"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.61"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.72"	if BR2_KERNEL_HEADERS_3_14
-	default "3.18.35"	if BR2_KERNEL_HEADERS_3_18
+	default "3.14.73"	if BR2_KERNEL_HEADERS_3_14
+	default "3.18.36"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.26"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.27"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
-	default "4.4.13"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.14"	if BR2_KERNEL_HEADERS_4_4
 	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
-	default "4.6.2"		if BR2_KERNEL_HEADERS_4_6
+	default "4.6.3"		if BR2_KERNEL_HEADERS_4_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.8.1
