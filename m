From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Mar 2015 08:33:09 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.{12,18}.x series
Message-ID: <1427283189-20503-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2d32168..6e32356 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -194,12 +194,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.106"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.72"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.38"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.39"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
 	default "3.14.36"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
-	default "3.18.9"	if BR2_KERNEL_HEADERS_3_18
+	default "3.18.10"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.2"	if BR2_KERNEL_HEADERS_3_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.0.5
