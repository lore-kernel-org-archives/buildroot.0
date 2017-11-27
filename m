From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 27 Nov 2017 07:22:25 +0100
Subject: [Buildroot] [PATCH 1/1] linux-headers: bump 3.2.x series
Message-ID: <20171127062225.3391-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 61a9414231..cff856eaeb 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -239,7 +239,7 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.95"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.96"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.108"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
-- 
2.11.0
