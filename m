From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 22 Mar 2018 20:15:07 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 4.{4, 9}.x series
Message-ID: <1521760507-21517-1-git-send-email-festevam@gmail.com>
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
index 3d94ca9..3a8adfd 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -242,8 +242,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.101"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.50"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.122"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.88"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.123"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.89"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
-- 
2.7.4
