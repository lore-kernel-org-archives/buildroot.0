From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Wed, 7 Jun 2017 12:50:15 -0300
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{4, 9, 11}.x series
In-Reply-To: <1496850615-21476-1-git-send-email-fabio.estevam@nxp.com>
References: <1496850615-21476-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <1496850615-21476-2-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <festevam@gmail.com>

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b493234..40ef88f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -227,8 +227,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.40"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.70"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.30"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.71"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.31"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
-	default "4.11.3"	if BR2_KERNEL_HEADERS_4_11
+	default "4.11.4"	if BR2_KERNEL_HEADERS_4_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
