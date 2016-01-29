From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 29 Jan 2016 18:19:53 -0300
Subject: [Buildroot] [PATCH] linux-headers: bump 3.{10, 14}.x series
Message-ID: <1454102393-644-1-git-send-email-gustavo@zacarias.com.ar>
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
index 013b1f2..bdc7ef0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -204,9 +204,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.76"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.110"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.95"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.96"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.53"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.59"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.60"	if BR2_KERNEL_HEADERS_3_14
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.26"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
-- 
2.4.10
