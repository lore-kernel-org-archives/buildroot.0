From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Tue, 23 Jan 2018 10:38:15 -0200
Subject: [Buildroot] [PATCH] linux-headers: bump 4.1.x series
Message-ID: <1516711095-3373-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <festevam@gmail.com>

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 46a6045..55b8df3 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -251,7 +251,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.108"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
-	default "4.1.48"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.49"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.112"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.77"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
-- 
2.7.4
