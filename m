From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  9 Oct 2014 20:20:02 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.{16, 14, 10}.x series
Message-ID: <1412896802-11171-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 95a06bb..101136a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -171,12 +171,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.63"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.104"	if BR2_KERNEL_HEADERS_3_4
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.56"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.57"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.30"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.20"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.21"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
-	default "3.16.4"	if BR2_KERNEL_HEADERS_3_16
+	default "3.16.5"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17"		if BR2_KERNEL_HEADERS_3_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.0.4
