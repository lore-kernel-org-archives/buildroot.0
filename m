From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 22 Jul 2015 11:18:39 -0300
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3.18.x and 4.{0,
	1}.x series
Message-ID: <1437574720-12784-1-git-send-email-gustavo@zacarias.com.ar>
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
index ec6e64d..2fcc39b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -217,8 +217,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
-	default "3.18.18"	if BR2_KERNEL_HEADERS_3_18
+	default "3.18.19"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
-	default "4.0.8"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.2"		if BR2_KERNEL_HEADERS_4_1
+	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
+	default "4.1.3"		if BR2_KERNEL_HEADERS_4_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.3.6
