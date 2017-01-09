From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  9 Jan 2017 07:29:09 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 4.{4, 8, 9}.x series
Message-ID: <20170109102910.724-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e96d45d..555b15a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -222,7 +222,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.37"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.40"	if BR2_KERNEL_HEADERS_4_4
-	default "4.8.16"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.1"		if BR2_KERNEL_HEADERS_4_9
+	default "4.4.41"	if BR2_KERNEL_HEADERS_4_4
+	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
+	default "4.9.2"		if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.10.2
