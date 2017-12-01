From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  1 Dec 2017 07:07:59 +0100
Subject: [Buildroot] [PATCH 1/1] linux-headers: bump 4.{4, 9}.x series
Message-ID: <20171201060759.2461-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index cff856eaeb..f44d4dfaa2 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -244,8 +244,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.108"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.46"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.102"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.65"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.103"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.66"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
-- 
2.11.0
