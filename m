From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 27 Jul 2016 18:31:06 -0300
Subject: [Buildroot] [PATCH] linux-headers: Bump to 4.6.5 kernel
Message-ID: <1469655066-27496-1-git-send-email-festevam@gmail.com>
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
index 2ad9ada..ddca42f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -248,6 +248,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
 	default "4.4.15"	if BR2_KERNEL_HEADERS_4_4
 	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
-	default "4.6.4"		if BR2_KERNEL_HEADERS_4_6
+	default "4.6.5"		if BR2_KERNEL_HEADERS_4_6
 	default "4.7"		if BR2_KERNEL_HEADERS_4_7
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.9.1
