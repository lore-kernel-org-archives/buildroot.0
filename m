From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 15 Jan 2017 18:24:26 -0200
Subject: [Buildroot] [PATCH v2 1/2] linux-headers: bump 4.{4, 9}.x series
Message-ID: <1484511867-357-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Also update 4.4 series

 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 206bf02..9cb40e5 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -222,7 +222,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.37"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.42"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.43"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.3"		if BR2_KERNEL_HEADERS_4_9
+	default "4.9.4"		if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
