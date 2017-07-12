From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Wed, 12 Jul 2017 12:40:38 -0300
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{9,11,12}.x series
In-Reply-To: <1499874038-32290-1-git-send-email-fabio.estevam@nxp.com>
References: <1499874038-32290-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <1499874038-32290-2-git-send-email-fabio.estevam@nxp.com>
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
index ab49b60..6dc519d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -236,8 +236,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.42"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.76"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.36"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.37"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
-	default "4.11.9"	if BR2_KERNEL_HEADERS_4_11
-	default "4.12"		if BR2_KERNEL_HEADERS_4_12
+	default "4.11.10"	if BR2_KERNEL_HEADERS_4_11
+	default "4.12.1"		if BR2_KERNEL_HEADERS_4_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
