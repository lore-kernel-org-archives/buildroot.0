From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 28 Feb 2016 11:03:53 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.{2, 12}.x series
Message-ID: <1456668233-4230-1-git-send-email-gustavo@zacarias.com.ar>
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
index 4a3651d..7aaed97 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -208,10 +208,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.77"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.78"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.110"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.98"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.54"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.55"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.62"	if BR2_KERNEL_HEADERS_3_14
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.27"	if BR2_KERNEL_HEADERS_3_18
-- 
2.4.10
