From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 17 Dec 2017 13:24:26 -0200
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.14.x series
In-Reply-To: <1513524266-32758-1-git-send-email-festevam@gmail.com>
References: <1513524266-32758-1-git-send-email-festevam@gmail.com>
Message-ID: <1513524266-32758-2-git-send-email-festevam@gmail.com>
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
index 522c2c4..11cb6fb 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -258,5 +258,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.6"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.7"	if BR2_KERNEL_HEADERS_4_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
