From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 13 Apr 2018 21:20:41 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 4.{4, 9}.x series
Message-ID: <1523665241-11856-1-git-send-email-festevam@gmail.com>
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
index 5bec53f..4b4c8dd 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -250,8 +250,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.101"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.51"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.127"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.93"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.128"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.94"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
-- 
2.7.4
