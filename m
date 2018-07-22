From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 22 Jul 2018 12:56:44 -0300
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{4, 9, 14,
 17}.x series
In-Reply-To: <1532275004-13376-1-git-send-email-festevam@gmail.com>
References: <1532275004-13376-1-git-send-email-festevam@gmail.com>
Message-ID: <1532275004-13376-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 56fde5f..fb40e96 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -258,14 +258,14 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.142"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.113"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.143"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.114"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.56"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.57"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
 	default "4.16.17"	if BR2_KERNEL_HEADERS_4_16
-	default "4.17.8"	if BR2_KERNEL_HEADERS_4_17
+	default "4.17.9"	if BR2_KERNEL_HEADERS_4_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
