From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Jun 2014 16:53:53 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.{4,10,12,14}.x series
Message-ID: <1402516433-29342-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 82778cc..a9d42ca 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -154,13 +154,13 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.60"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.92"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.93"	if BR2_KERNEL_HEADERS_3_4
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.42"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.43"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.21"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.22"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.6"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.7"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15"		if BR2_KERNEL_HEADERS_3_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.8.5.5
