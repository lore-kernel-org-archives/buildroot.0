From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 26 Mar 2017 10:49:43 -0300
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{4, 9, 10}.x series
In-Reply-To: <1490536183-19970-1-git-send-email-festevam@gmail.com>
References: <1490536183-19970-1-git-send-email-festevam@gmail.com>
Message-ID: <1490536183-19970-2-git-send-email-festevam@gmail.com>
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
index 4f17f26..4557e7c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -218,7 +218,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.72"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.39"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.56"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.17"	if BR2_KERNEL_HEADERS_4_9
-	default "4.10.5"	if BR2_KERNEL_HEADERS_4_10
+	default "4.4.57"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.18"	if BR2_KERNEL_HEADERS_4_9
+	default "4.10.6"	if BR2_KERNEL_HEADERS_4_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
