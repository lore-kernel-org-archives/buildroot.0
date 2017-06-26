From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 26 Jun 2017 16:35:57 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 4.4.x series
Message-ID: <1498505757-15325-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a29cd30..613a26e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -227,7 +227,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.106"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.41"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.73"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.74"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.34"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.7"	if BR2_KERNEL_HEADERS_4_11
-- 
2.7.4
