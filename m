From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  8 Apr 2017 11:01:04 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/linux-headers: bump bump 3.2.x
	and 4.{4, 9, 10}.x series
In-Reply-To: <20170408090104.32757-1-bernd.kuhls@t-online.de>
References: <20170408090104.32757-1-bernd.kuhls@t-online.de>
Message-ID: <20170408090104.32757-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added 3.2 bump

 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 32dadcd6d..f64d8d7ee 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -213,12 +213,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.87"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.88"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.72"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.39"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.59"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.20"	if BR2_KERNEL_HEADERS_4_9
-	default "4.10.8"	if BR2_KERNEL_HEADERS_4_10
+	default "4.4.60"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.21"	if BR2_KERNEL_HEADERS_4_9
+	default "4.10.9"	if BR2_KERNEL_HEADERS_4_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.11.0
