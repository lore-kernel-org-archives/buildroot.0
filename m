From: Fabio Estevam <festevam@gmail.com>
Date: Thu,  9 Feb 2017 08:27:09 -0200
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{4,
	9}.x and 3.18 series
In-Reply-To: <1486636029-10366-1-git-send-email-festevam@gmail.com>
References: <1486636029-10366-1-git-send-email-festevam@gmail.com>
Message-ID: <1486636029-10366-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 20c9610..b1d117a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -218,11 +218,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.104"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.70"	if BR2_KERNEL_HEADERS_3_12
-	default "3.18.47"	if BR2_KERNEL_HEADERS_3_18
+	default "3.18.48"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.38"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.47"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.48"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.8"		if BR2_KERNEL_HEADERS_4_9
+	default "4.9.9"		if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
