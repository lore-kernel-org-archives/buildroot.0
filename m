From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Jun 2018 10:20:30 +0200
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{4, 9, 14, 16,
 17}.x series
In-Reply-To: <20180616082030.12349-1-bernd.kuhls@t-online.de>
References: <20180616082030.12349-1-bernd.kuhls@t-online.de>
Message-ID: <20180616082030.12349-2-bernd.kuhls@t-online.de>
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
index 0a8ca79b08..24a2433f27 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -258,14 +258,14 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.137"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.108"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.138"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.109"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.49"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.50"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
-	default "4.16.15"	if BR2_KERNEL_HEADERS_4_16
-	default "4.17.1"	if BR2_KERNEL_HEADERS_4_17
+	default "4.16.16"	if BR2_KERNEL_HEADERS_4_16
+	default "4.17.2"	if BR2_KERNEL_HEADERS_4_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.17.1
