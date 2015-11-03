From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Nov 2015 18:48:53 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.{12, 18}.x series
Message-ID: <1446587333-23031-1-git-send-email-gustavo@zacarias.com.ar>
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
index 913cc2a..d2686b6 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -202,11 +202,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.72"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.110"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.92"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.49"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.50"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.56"	if BR2_KERNEL_HEADERS_3_14
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
-	default "3.18.23"	if BR2_KERNEL_HEADERS_3_18
+	default "3.18.24"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.12"	if BR2_KERNEL_HEADERS_4_1
-- 
2.4.10
