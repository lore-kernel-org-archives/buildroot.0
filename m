From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  3 May 2017 21:36:29 +0200
Subject: [Buildroot] [PATCH] linux-headers: bump 4.{4,9,10}.x series
Message-ID: <20170503193629.5291-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f75fac8a1..dcfcce94c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -227,8 +227,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.73"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.39"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.65"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.25"	if BR2_KERNEL_HEADERS_4_9
-	default "4.10.13"	if BR2_KERNEL_HEADERS_4_10
+	default "4.4.66"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.26"	if BR2_KERNEL_HEADERS_4_9
+	default "4.10.14"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11"		if BR2_KERNEL_HEADERS_4_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.11.0
