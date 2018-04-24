From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 24 Apr 2018 07:38:58 -0300
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{4, 9, 14,
 16}.x series
In-Reply-To: <1524566338-4841-1-git-send-email-festevam@gmail.com>
References: <1524566338-4841-1-git-send-email-festevam@gmail.com>
Message-ID: <1524566338-4841-2-git-send-email-festevam@gmail.com>
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
index 68ac47c..c9774ed 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -250,13 +250,13 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.101"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.51"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.128"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.95"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.129"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.96"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.35"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.36"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
-	default "4.16.3"	if BR2_KERNEL_HEADERS_4_16
+	default "4.16.4"	if BR2_KERNEL_HEADERS_4_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
