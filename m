From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  9 Sep 2018 16:34:11 +0200
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 4.18.x series
Message-ID: <20180909143412.27004-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c2c0443af2..cc2d86db3a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -258,5 +258,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.9.125"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.68"	if BR2_KERNEL_HEADERS_4_14
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
-	default "4.18.5"	if BR2_KERNEL_HEADERS_4_18
+	default "4.18.7"	if BR2_KERNEL_HEADERS_4_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.18.0
