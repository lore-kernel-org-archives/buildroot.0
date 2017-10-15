From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 15 Oct 2017 22:17:04 +0200
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.13.x series
In-Reply-To: <20171015201704.7438-1-bernd.kuhls@t-online.de>
References: <20171015201704.7438-1-bernd.kuhls@t-online.de>
Message-ID: <20171015201704.7438-2-bernd.kuhls@t-online.de>
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
index 581d4b7ad2..6421b217a7 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -249,5 +249,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
-	default "4.13.6"	if BR2_KERNEL_HEADERS_4_13
+	default "4.13.7"	if BR2_KERNEL_HEADERS_4_13
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.11.0
