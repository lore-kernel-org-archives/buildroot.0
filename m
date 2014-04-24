From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 24 Apr 2014 08:13:39 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.{12,13}.x series
Message-ID: <1398338019-25266-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 23586fb..001c424 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -163,7 +163,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
 	default "3.10.37"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.17"	if BR2_KERNEL_HEADERS_3_12
-	default "3.13.10"	if BR2_KERNEL_HEADERS_3_13
+	default "3.12.18"	if BR2_KERNEL_HEADERS_3_12
+	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
 	default "3.14.1"	if BR2_KERNEL_HEADERS_3_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.8.3.2
