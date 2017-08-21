From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Mon, 21 Aug 2017 15:28:23 -0300
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 3.{2, 10}.x and 4.{4, 9,
	12}.x series
In-Reply-To: <1503340103-8124-1-git-send-email-fabio.estevam@nxp.com>
References: <1503340103-8124-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <1503340103-8124-2-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 package/linux-headers/Config.in.host | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7f07da0..7f1bf6d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -231,14 +231,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.89"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.91"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.106"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.107"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.43"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.80"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.41"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.83"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.44"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
-	default "4.12.5"	if BR2_KERNEL_HEADERS_4_12
+	default "4.12.8"	if BR2_KERNEL_HEADERS_4_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
