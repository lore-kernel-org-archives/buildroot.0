From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 26 Nov 2016 12:28:34 -0200
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 4.{4, 8}.x series
Message-ID: <1480170515-4534-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5c42d53..6d616c3 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -232,9 +232,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.35"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.34"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.35"	if BR2_KERNEL_HEADERS_4_4
 	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
 	default "4.6.7"		if BR2_KERNEL_HEADERS_4_6
 	default "4.7.10"	if BR2_KERNEL_HEADERS_4_7
-	default "4.8.10"	if BR2_KERNEL_HEADERS_4_8
+	default "4.8.11"	if BR2_KERNEL_HEADERS_4_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
