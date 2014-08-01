From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  1 Aug 2014 18:35:16 -0300
Subject: [Buildroot] [PATCH v2 1/2] linux-headers: bump 3.{4, 10, 12, 14,
	15}.x series
Message-ID: <1406928917-7068-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c4ec358..7b55fdf 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -149,12 +149,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.61"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.100"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.101"	if BR2_KERNEL_HEADERS_3_4
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.50"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.51"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.25"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.26"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.14"	if BR2_KERNEL_HEADERS_3_14
-	default "3.15.7"	if BR2_KERNEL_HEADERS_3_15
+	default "3.14.15"	if BR2_KERNEL_HEADERS_3_14
+	default "3.15.8"	if BR2_KERNEL_HEADERS_3_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.8.5.5
