From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Mar 2014 20:46:58 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.12.x stable version
Message-ID: <1396050418-6264-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f55f833..1fa498d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -158,6 +158,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
 	default "3.10.34"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.14"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.15"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.7"	if BR2_KERNEL_HEADERS_3_13
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.8.3.2
