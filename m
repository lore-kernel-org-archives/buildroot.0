From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 21 Mar 2018 19:06:32 +0100
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 3.2.x and 4.{14,
 15}.x series
In-Reply-To: <20180321180632.2434-1-bernd.kuhls@t-online.de>
References: <20180321180632.2434-1-bernd.kuhls@t-online.de>
Message-ID: <20180321180632.2434-2-bernd.kuhls@t-online.de>
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
index a99f0fa137..3d94ca986d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -240,7 +240,7 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.100"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.101"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.50"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.122"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.88"	if BR2_KERNEL_HEADERS_4_9
@@ -248,6 +248,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.28"	if BR2_KERNEL_HEADERS_4_14
-	default "4.15.11"	if BR2_KERNEL_HEADERS_4_15
+	default "4.14.29"	if BR2_KERNEL_HEADERS_4_14
+	default "4.15.12"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.11.0
