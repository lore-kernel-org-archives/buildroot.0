From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 27 Jul 2016 18:38:01 -0300
Subject: [Buildroot] [PATCH v2]  linux-headers: bump 3.14.x and 4.{4,
	6}.x series
Message-ID: <1469655481-27707-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- Also bump 4.4 and 3.14

 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2ad9ada..089d424 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -239,15 +239,15 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.112"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.102"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.62"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.73"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.74"	if BR2_KERNEL_HEADERS_3_14
 	default "3.18.37"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.28"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
-	default "4.4.15"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.16"	if BR2_KERNEL_HEADERS_4_4
 	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
-	default "4.6.4"		if BR2_KERNEL_HEADERS_4_6
+	default "4.6.5"		if BR2_KERNEL_HEADERS_4_6
 	default "4.7"		if BR2_KERNEL_HEADERS_4_7
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.9.1
