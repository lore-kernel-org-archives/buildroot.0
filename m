From: Fabio Estevam <festevam@gmail.com>
Date: Wed,  1 Jun 2016 23:03:52 -0300
Subject: [Buildroot] [PATCH] linux-headers: Bump to 4.6.1 kernel
Message-ID: <1464833032-15304-1-git-send-email-festevam@gmail.com>
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
index c07455a..6890c9e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -231,5 +231,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
 	default "4.4.11"	if BR2_KERNEL_HEADERS_4_4
 	default "4.5.5"		if BR2_KERNEL_HEADERS_4_5
-	default "4.6"		if BR2_KERNEL_HEADERS_4_6
+	default "4.6.1"		if BR2_KERNEL_HEADERS_4_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.9.1
