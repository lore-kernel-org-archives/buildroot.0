From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 24 Mar 2014 08:48:39 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3.{4, 10,
	13}.x stable versions
Message-ID: <1395661720-26681-1-git-send-email-gustavo@zacarias.com.ar>
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
index a3f26cd..f55f833 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -151,13 +151,13 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.55"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.83"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.84"	if BR2_KERNEL_HEADERS_3_4
 	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
 	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.33"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.34"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.14"	if BR2_KERNEL_HEADERS_3_12
-	default "3.13.6"	if BR2_KERNEL_HEADERS_3_13
+	default "3.13.7"	if BR2_KERNEL_HEADERS_3_13
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.8.3.2
