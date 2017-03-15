From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 15 Mar 2017 08:03:47 -0300
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{4, 9, 19}.x series
In-Reply-To: <1489575828-26590-1-git-send-email-festevam@gmail.com>
References: <1489575828-26590-1-git-send-email-festevam@gmail.com>
Message-ID: <1489575828-26590-2-git-send-email-festevam@gmail.com>
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
index 57e690e..eb06ff2 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -218,7 +218,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.70"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.38"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.52"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.13"	if BR2_KERNEL_HEADERS_4_9
-	default "4.10.1"	if BR2_KERNEL_HEADERS_4_10
+	default "4.4.54"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.15"	if BR2_KERNEL_HEADERS_4_9
+	default "4.10.3"	if BR2_KERNEL_HEADERS_4_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
