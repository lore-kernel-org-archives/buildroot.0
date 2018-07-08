From: Fabio Estevam <festevam@gmail.com>
Date: Sun,  8 Jul 2018 16:00:16 -0300
Subject: [Buildroot] [PATCH 2/2]  linux-headers: bump 4.{14, 17}.x series
In-Reply-To: <1531076416-8772-1-git-send-email-festevam@gmail.com>
References: <1531076416-8772-1-git-send-email-festevam@gmail.com>
Message-ID: <1531076416-8772-2-git-send-email-festevam@gmail.com>
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
index 0c9b102..8965ecf 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -264,8 +264,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.53"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.54"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
 	default "4.16.17"	if BR2_KERNEL_HEADERS_4_16
-	default "4.17.4"	if BR2_KERNEL_HEADERS_4_17
+	default "4.17.5"	if BR2_KERNEL_HEADERS_4_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
