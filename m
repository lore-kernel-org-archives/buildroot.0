From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 16 Mar 2016 21:55:34 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.{10,
	14}.x and 4.4.x series
Message-ID: <1458176134-30804-1-git-send-email-gustavo@zacarias.com.ar>
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
index 0d1a1a9..ae44a2f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -212,15 +212,15 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.78"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.110"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.100"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.101"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.56"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.64"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.65"	if BR2_KERNEL_HEADERS_3_14
 	default "3.18.28"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.19"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
-	default "4.4.5"		if BR2_KERNEL_HEADERS_4_4
+	default "4.4.6"		if BR2_KERNEL_HEADERS_4_4
 	default "4.5"		if BR2_KERNEL_HEADERS_4_5
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.4.10
