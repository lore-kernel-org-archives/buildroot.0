From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Aug 2017 17:29:26 +0200
Subject: [Buildroot] [PATCH 1/1] linux-headers: bump 3.{2, 10}.x series
Message-ID: <20170827152926.26350-1-bernd.kuhls@t-online.de>
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
index a45172ed1..992e31bb4 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -231,9 +231,9 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.89"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.92"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.106"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.107"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.43"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.84"	if BR2_KERNEL_HEADERS_4_4
-- 
2.11.0
