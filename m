From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 29 Jun 2017 09:38:06 -0300
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{4, 9, 11}.x series
In-Reply-To: <1498739886-31072-1-git-send-email-festevam@gmail.com>
References: <1498739886-31072-1-git-send-email-festevam@gmail.com>
Message-ID: <1498739886-31072-2-git-send-email-festevam@gmail.com>
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
index 613a26e..469d903 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -227,8 +227,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.106"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.41"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.74"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.34"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.75"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.35"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
-	default "4.11.7"	if BR2_KERNEL_HEADERS_4_11
+	default "4.11.8"	if BR2_KERNEL_HEADERS_4_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
