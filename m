From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 14 Dec 2017 15:28:34 -0200
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{9, 14}.x series
In-Reply-To: <1513272514-3427-1-git-send-email-festevam@gmail.com>
References: <1513272514-3427-1-git-send-email-festevam@gmail.com>
Message-ID: <1513272514-3427-2-git-send-email-festevam@gmail.com>
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
index db08963..eec9635 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -253,10 +253,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.47"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.105"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.68"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.69"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.5"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.6"	if BR2_KERNEL_HEADERS_4_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
