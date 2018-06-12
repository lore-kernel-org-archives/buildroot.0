From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 12 Jun 2018 15:04:54 -0300
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{14, 16, 17}.x series
In-Reply-To: <1528826694-13498-1-git-send-email-festevam@gmail.com>
References: <1528826694-13498-1-git-send-email-festevam@gmail.com>
Message-ID: <1528826694-13498-2-git-send-email-festevam@gmail.com>
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
index 5f6c834..efdeb3b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -264,8 +264,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.48"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.49"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
-	default "4.16.14"	if BR2_KERNEL_HEADERS_4_16
-	default "4.17"		if BR2_KERNEL_HEADERS_4_17
+	default "4.16.15"	if BR2_KERNEL_HEADERS_4_16
+	default "4.17.1"	if BR2_KERNEL_HEADERS_4_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
