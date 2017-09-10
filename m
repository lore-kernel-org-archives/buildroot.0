From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Sep 2017 09:13:32 +0200
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 4.{9, 12, 13}.x series
Message-ID: <20170910071333.4788-1-bernd.kuhls@t-online.de>
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
index dda662452..d30dea045 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -245,9 +245,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.43"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.87"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.48"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.49"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
-	default "4.12.11"	if BR2_KERNEL_HEADERS_4_12
-	default "4.13"		if BR2_KERNEL_HEADERS_4_13
+	default "4.12.12"	if BR2_KERNEL_HEADERS_4_12
+	default "4.13.1"	if BR2_KERNEL_HEADERS_4_13
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.11.0
