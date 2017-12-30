From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 30 Dec 2017 13:16:47 -0200
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{9, 14}.x series
In-Reply-To: <1514647007-14561-1-git-send-email-festevam@gmail.com>
References: <1514647007-14561-1-git-send-email-festevam@gmail.com>
Message-ID: <1514647007-14561-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9d7fae5..6802217 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -253,10 +253,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.48"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.108"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.72"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.73"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.9"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.10"	if BR2_KERNEL_HEADERS_4_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
