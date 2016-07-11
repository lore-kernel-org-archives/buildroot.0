From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 11 Jul 2016 16:31:32 -0300
Subject: [Buildroot] [PATCH 2/2] linux-headers: Bump to 4.6.4 kernel
In-Reply-To: <1468265492-28037-1-git-send-email-festevam@gmail.com>
References: <1468265492-28037-1-git-send-email-festevam@gmail.com>
Message-ID: <1468265492-28037-2-git-send-email-festevam@gmail.com>
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
index 930acc1..82ce45c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -240,5 +240,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
 	default "4.4.14"	if BR2_KERNEL_HEADERS_4_4
 	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
-	default "4.6.3"		if BR2_KERNEL_HEADERS_4_6
+	default "4.6.4"		if BR2_KERNEL_HEADERS_4_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.9.1
