From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 29 Mar 2018 08:31:00 -0300
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{1, 4, 9, 14,
 15}.x series
In-Reply-To: <1522323060-27916-1-git-send-email-festevam@gmail.com>
References: <1522323060-27916-1-git-send-email-festevam@gmail.com>
Message-ID: <1522323060-27916-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/linux-headers/Config.in.host | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f4c1427..ec3de2b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -241,13 +241,13 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.101"	if BR2_KERNEL_HEADERS_3_2
-	default "4.1.50"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.124"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.90"	if BR2_KERNEL_HEADERS_4_9
+	default "4.1.51"	if BR2_KERNEL_HEADERS_4_1
+	default "4.4.125"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.91"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.30"	if BR2_KERNEL_HEADERS_4_14
-	default "4.15.13"	if BR2_KERNEL_HEADERS_4_15
+	default "4.14.31"	if BR2_KERNEL_HEADERS_4_14
+	default "4.15.14"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
