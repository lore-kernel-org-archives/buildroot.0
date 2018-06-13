From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 13 Jun 2018 14:04:26 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 4.{4, 9}.x series
Message-ID: <1528909466-4156-1-git-send-email-festevam@gmail.com>
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
index efdeb3b..0a8ca79 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -258,8 +258,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.136"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.107"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.137"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.108"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
-- 
2.7.4
