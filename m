From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Jul 2014 17:55:02 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3.{4, 10, 14,
	15}.x series
Message-ID: <1404939303-8530-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 36e09ec..50c4da5 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -149,12 +149,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.60"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.97"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.98"	if BR2_KERNEL_HEADERS_3_4
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.47"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.48"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.24"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.11"	if BR2_KERNEL_HEADERS_3_14
-	default "3.15.4"	if BR2_KERNEL_HEADERS_3_15
+	default "3.14.12"	if BR2_KERNEL_HEADERS_3_14
+	default "3.15.5"	if BR2_KERNEL_HEADERS_3_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.8.5.5
