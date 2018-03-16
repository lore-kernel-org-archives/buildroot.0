From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 16 Mar 2018 11:57:06 -0300
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{14, 15}.x series
In-Reply-To: <1521212226-32557-1-git-send-email-festevam@gmail.com>
References: <1521212226-32557-1-git-send-email-festevam@gmail.com>
Message-ID: <1521212226-32557-2-git-send-email-festevam@gmail.com>
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
index 1560df0..fd82049 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -248,6 +248,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.26"	if BR2_KERNEL_HEADERS_4_14
-	default "4.15.9"	if BR2_KERNEL_HEADERS_4_15
+	default "4.14.27"	if BR2_KERNEL_HEADERS_4_14
+	default "4.15.10"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
