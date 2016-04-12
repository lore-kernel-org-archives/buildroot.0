From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 12 Apr 2016 14:32:23 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3.14.x and 4.{4,
	5}.x series
Message-ID: <1460482344-13038-1-git-send-email-gustavo@zacarias.com.ar>
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
index 70d5faa..f78e5c7 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -214,13 +214,13 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.111"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.101"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.56"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.65"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.66"	if BR2_KERNEL_HEADERS_3_14
 	default "3.18.30"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.21"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
-	default "4.4.6"		if BR2_KERNEL_HEADERS_4_4
-	default "4.5"		if BR2_KERNEL_HEADERS_4_5
+	default "4.4.7"		if BR2_KERNEL_HEADERS_4_4
+	default "4.5.1"		if BR2_KERNEL_HEADERS_4_5
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.3
