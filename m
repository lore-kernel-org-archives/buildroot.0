From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 22 May 2018 19:46:34 -0300
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{9, 14, 16}.x series
In-Reply-To: <1527029194-2878-1-git-send-email-festevam@gmail.com>
References: <1527029194-2878-1-git-send-email-festevam@gmail.com>
Message-ID: <1527029194-2878-2-git-send-email-festevam@gmail.com>
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
index c7640f1..fb5683c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -251,12 +251,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.101"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.51"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.131"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.101"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.102"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.42"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.43"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
-	default "4.16.10"	if BR2_KERNEL_HEADERS_4_16
+	default "4.16.11"	if BR2_KERNEL_HEADERS_4_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
