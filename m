From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  4 Oct 2015 20:12:42 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.18.x series
Message-ID: <1444000362-31447-1-git-send-email-gustavo@zacarias.com.ar>
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
index 2e28f78..8a9682a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -198,7 +198,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.14.54"	if BR2_KERNEL_HEADERS_3_14
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
-	default "3.18.21"	if BR2_KERNEL_HEADERS_3_18
+	default "3.18.22"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.10"	if BR2_KERNEL_HEADERS_4_1
-- 
2.4.9
