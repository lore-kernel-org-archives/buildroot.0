From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 24 Jun 2017 16:39:52 -0300
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 3.10.x and 4.{9,
	11}.x series
In-Reply-To: <1498333192-12289-1-git-send-email-festevam@gmail.com>
References: <1498333192-12289-1-git-send-email-festevam@gmail.com>
Message-ID: <1498333192-12289-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6704305..a29cd30 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -224,11 +224,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.89"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.106"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.41"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.73"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.33"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.34"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
-	default "4.11.6"	if BR2_KERNEL_HEADERS_4_11
+	default "4.11.7"	if BR2_KERNEL_HEADERS_4_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
