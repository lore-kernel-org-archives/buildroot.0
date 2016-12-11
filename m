From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 11 Dec 2016 19:43:37 -0200
Subject: [Buildroot] [PATCH 3/3] linux-headers: bump 4.{8, 4}.x series
In-Reply-To: <1481492617-23250-1-git-send-email-festevam@gmail.com>
References: <1481492617-23250-1-git-send-email-festevam@gmail.com>
Message-ID: <1481492617-23250-3-git-send-email-festevam@gmail.com>
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
index 18d7cd0..7c71a6c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -240,10 +240,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.36"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.37"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.38"	if BR2_KERNEL_HEADERS_4_4
 	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
 	default "4.6.7"		if BR2_KERNEL_HEADERS_4_6
 	default "4.7.10"	if BR2_KERNEL_HEADERS_4_7
-	default "4.8.13"	if BR2_KERNEL_HEADERS_4_8
+	default "4.8.14"	if BR2_KERNEL_HEADERS_4_8
 	default "4.9"		if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
