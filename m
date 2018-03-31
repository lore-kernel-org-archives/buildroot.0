From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 31 Mar 2018 15:34:58 -0300
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{4, 9, 14,
 15}.x series
In-Reply-To: <1522521298-25062-1-git-send-email-festevam@gmail.com>
References: <1522521298-25062-1-git-send-email-festevam@gmail.com>
Message-ID: <1522521298-25062-2-git-send-email-festevam@gmail.com>
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
index ec3de2b..2a59e29 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -242,12 +242,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.101"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.51"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.125"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.91"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.126"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.92"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.31"	if BR2_KERNEL_HEADERS_4_14
-	default "4.15.14"	if BR2_KERNEL_HEADERS_4_15
+	default "4.14.32"	if BR2_KERNEL_HEADERS_4_14
+	default "4.15.15"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
