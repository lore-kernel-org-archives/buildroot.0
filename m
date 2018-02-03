From: Fabio Estevam <festevam@gmail.com>
Date: Sat,  3 Feb 2018 16:14:52 -0200
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{4, 9, 14,
 15}.x series
In-Reply-To: <1517681692-13091-1-git-send-email-festevam@gmail.com>
References: <1517681692-13091-1-git-send-email-festevam@gmail.com>
Message-ID: <1517681692-13091-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e34636a..e0f97f3 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -260,12 +260,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.108"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.49"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.114"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.79"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.115"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.80"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.16"	if BR2_KERNEL_HEADERS_4_14
-	default "4.15"		if BR2_KERNEL_HEADERS_4_15
+	default "4.14.17"	if BR2_KERNEL_HEADERS_4_14
+	default "4.15.1"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
