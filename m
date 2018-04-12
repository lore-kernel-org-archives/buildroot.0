From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 12 Apr 2018 08:11:28 -0300
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{15, 16}.x series
In-Reply-To: <1523531488-573-1-git-send-email-festevam@gmail.com>
References: <1523531488-573-1-git-send-email-festevam@gmail.com>
Message-ID: <1523531488-573-2-git-send-email-festevam@gmail.com>
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
index 40faef2..5bec53f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -257,6 +257,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
 	default "4.14.33"	if BR2_KERNEL_HEADERS_4_14
-	default "4.15.16"	if BR2_KERNEL_HEADERS_4_15
-	default "4.16.1"	if BR2_KERNEL_HEADERS_4_16
+	default "4.15.17"	if BR2_KERNEL_HEADERS_4_15
+	default "4.16.2"	if BR2_KERNEL_HEADERS_4_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
