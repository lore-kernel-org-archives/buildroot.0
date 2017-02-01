From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Wed, 1 Feb 2017 13:25:34 -0200
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{4,
	9}.x and 3.12 series
In-Reply-To: <1485962734-15301-1-git-send-email-fabio.estevam@nxp.com>
References: <1485962734-15301-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <1485962734-15301-2-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8d47365..671be96 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -217,12 +217,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.84"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.104"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.69"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.70"	if BR2_KERNEL_HEADERS_3_12
 	default "3.18.47"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.38"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.45"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.46"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.6"		if BR2_KERNEL_HEADERS_4_9
+	default "4.9.7"		if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
