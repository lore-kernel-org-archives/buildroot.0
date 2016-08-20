From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 20 Aug 2016 12:05:13 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.14.x series
Message-ID: <1471705513-1057-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3384cb0..9b4081a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -239,7 +239,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.112"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.102"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.62"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.76"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.77"	if BR2_KERNEL_HEADERS_3_14
 	default "3.18.39"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-- 
1.9.1
