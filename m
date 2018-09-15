From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 15 Sep 2018 12:35:54 -0300
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{4, 9, 14,
 18}.x series
In-Reply-To: <1537025754-14134-1-git-send-email-festevam@gmail.com>
References: <1537025754-14134-1-git-send-email-festevam@gmail.com>
Message-ID: <1537025754-14134-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e11f07f..9eea914 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -254,9 +254,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.155"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.126"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.69"	if BR2_KERNEL_HEADERS_4_14
+	default "4.4.156"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.127"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.70"	if BR2_KERNEL_HEADERS_4_14
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
-	default "4.18.7"	if BR2_KERNEL_HEADERS_4_18
+	default "4.18.8"	if BR2_KERNEL_HEADERS_4_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
