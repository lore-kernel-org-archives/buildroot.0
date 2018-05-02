From: Fabio Estevam <festevam@gmail.com>
Date: Wed,  2 May 2018 16:24:12 -0300
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{4, 9, 14,
 16}.x series
In-Reply-To: <1525289052-8343-1-git-send-email-festevam@gmail.com>
References: <1525289052-8343-1-git-send-email-festevam@gmail.com>
Message-ID: <1525289052-8343-2-git-send-email-festevam@gmail.com>
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
index 170a309..554f72c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -250,13 +250,13 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.101"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.51"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.130"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.97"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.131"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.98"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.38"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.39"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
-	default "4.16.6"	if BR2_KERNEL_HEADERS_4_16
+	default "4.16.7"	if BR2_KERNEL_HEADERS_4_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
