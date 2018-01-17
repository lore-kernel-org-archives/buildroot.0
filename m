From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 17 Jan 2018 09:24:38 -0200
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{4, 9, 14}.x series
In-Reply-To: <1516188278-27271-1-git-send-email-festevam@gmail.com>
References: <1516188278-27271-1-git-send-email-festevam@gmail.com>
Message-ID: <1516188278-27271-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 04b5cb8..46a6045 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -252,11 +252,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.108"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.48"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.111"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.76"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.112"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.77"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.13"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.14"	if BR2_KERNEL_HEADERS_4_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
