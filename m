From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  5 Jul 2017 18:37:55 +0200
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 4.{4,9,11}.x series
Message-ID: <20170705163756.1916-1-bernd.kuhls@t-online.de>
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
index 3b91c04e8..be0799bc5 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -227,8 +227,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.106"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.42"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.75"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.35"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.76"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.36"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
-	default "4.11.8"	if BR2_KERNEL_HEADERS_4_11
+	default "4.11.9"	if BR2_KERNEL_HEADERS_4_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.11.0
