From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Sep 2015 18:39:59 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3.{4, 10, 12,
	14}.x and 4.{1, 2}.x series
Message-ID: <1442871600-9139-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index fcd276b..9bb16b9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -192,15 +192,15 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.71"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.108"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.88"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.47"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.52"	if BR2_KERNEL_HEADERS_3_14
+	default "3.4.109"	if BR2_KERNEL_HEADERS_3_4
+	default "3.10.89"	if BR2_KERNEL_HEADERS_3_10
+	default "3.12.48"	if BR2_KERNEL_HEADERS_3_12
+	default "3.14.53"	if BR2_KERNEL_HEADERS_3_14
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.21"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.7"		if BR2_KERNEL_HEADERS_4_1
-	default "4.2"		if BR2_KERNEL_HEADERS_4_2
+	default "4.1.8"		if BR2_KERNEL_HEADERS_4_1
+	default "4.2.1"		if BR2_KERNEL_HEADERS_4_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.4.9
