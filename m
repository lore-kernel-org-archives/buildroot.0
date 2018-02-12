From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 12 Feb 2018 10:39:00 -0200
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.15.x series
In-Reply-To: <1518439140-29695-1-git-send-email-festevam@gmail.com>
References: <1518439140-29695-1-git-send-email-festevam@gmail.com>
Message-ID: <1518439140-29695-2-git-send-email-festevam@gmail.com>
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
index 2354761..07d096c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -249,5 +249,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
 	default "4.14.18"	if BR2_KERNEL_HEADERS_4_14
-	default "4.15.2"	if BR2_KERNEL_HEADERS_4_15
+	default "4.15.3"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
