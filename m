From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 13 Oct 2017 13:14:43 -0300
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 3.2.x and 4.{4, 9,
	13}.x series
In-Reply-To: <1507911283-18681-1-git-send-email-festevam@gmail.com>
References: <1507911283-18681-1-git-send-email-festevam@gmail.com>
Message-ID: <1507911283-18681-2-git-send-email-festevam@gmail.com>
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
index 9e1a77f..581d4b7 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -239,15 +239,15 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.93"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.94"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.107"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.43"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.90"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.53"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.92"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.56"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
-	default "4.13.5"	if BR2_KERNEL_HEADERS_4_13
+	default "4.13.6"	if BR2_KERNEL_HEADERS_4_13
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
