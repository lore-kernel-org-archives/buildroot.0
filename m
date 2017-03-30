From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Thu, 30 Mar 2017 11:24:45 -0300
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{4, 9, 10}.x series
In-Reply-To: <1490883885-3215-1-git-send-email-fabio.estevam@nxp.com>
References: <1490883885-3215-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <1490883885-3215-2-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <festevam@gmail.com>

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4557e7c..b2f63ae 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -218,7 +218,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.72"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.39"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.57"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.18"	if BR2_KERNEL_HEADERS_4_9
-	default "4.10.6"	if BR2_KERNEL_HEADERS_4_10
+	default "4.4.58"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.19"	if BR2_KERNEL_HEADERS_4_9
+	default "4.10.7"	if BR2_KERNEL_HEADERS_4_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
