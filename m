From: Fabio Estevam <festevam@gmail.com>
Date: Sun,  4 Mar 2018 12:02:47 -0300
Subject: [Buildroot] [PATCH v2] linux-headers: bump 4.{9, 14}.x series
Message-ID: <1520175767-6243-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Also bump 4.14

 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 397068d..d74f267 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -243,11 +243,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.99"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.49"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.119"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.85"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.86"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.23"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.24"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.7"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
