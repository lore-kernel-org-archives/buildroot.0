From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Dec 2014 13:34:19 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.{12, 2}.x series
Message-ID: <1418661259-14298-1-git-send-email-gustavo@zacarias.com.ar>
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
index 368759d..135b578 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -172,11 +172,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
-	default "3.2.64"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.65"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.105"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.62"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.34"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.35"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
 	default "3.14.26"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
-- 
2.0.4
