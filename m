From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 13 Feb 2018 19:18:19 -0200
Subject: [Buildroot] [PATCH] linux-headers: bump 4.{9, 14}.x series
Message-ID: <1518556699-2811-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2354761..f237a3f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -243,11 +243,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.98"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.49"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.115"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.80"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.81"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.18"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.19"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.2"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
