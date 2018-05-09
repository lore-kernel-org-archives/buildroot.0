From: Fabio Estevam <festevam@gmail.com>
Date: Wed,  9 May 2018 13:54:03 -0300
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{9, 14, 16}.x series
In-Reply-To: <1525884843-7282-1-git-send-email-festevam@gmail.com>
References: <1525884843-7282-1-git-send-email-festevam@gmail.com>
Message-ID: <1525884843-7282-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 554f72c..d37b68a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -251,12 +251,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.101"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.51"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.131"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.98"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.99"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.39"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.40"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
-	default "4.16.7"	if BR2_KERNEL_HEADERS_4_16
+	default "4.16.8"	if BR2_KERNEL_HEADERS_4_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
