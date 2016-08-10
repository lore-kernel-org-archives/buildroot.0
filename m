From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 10 Aug 2016 08:16:47 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.{14, 18}.x and 4.{1, 4,
	6}.x series
Message-ID: <1470827807-6125-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 package/linux-headers/Config.in.host | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ae5cc5d..771befb 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -239,15 +239,15 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.112"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.102"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.62"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.74"	if BR2_KERNEL_HEADERS_3_14
-	default "3.18.38"	if BR2_KERNEL_HEADERS_3_18
+	default "3.14.75"	if BR2_KERNEL_HEADERS_3_14
+	default "3.18.39"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.29"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.30"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
-	default "4.4.16"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.17"	if BR2_KERNEL_HEADERS_4_4
 	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
-	default "4.6.5"		if BR2_KERNEL_HEADERS_4_6
+	default "4.6.6"		if BR2_KERNEL_HEADERS_4_6
 	default "4.7"		if BR2_KERNEL_HEADERS_4_7
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.9.1
