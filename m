From: Fabio Estevam <festevam@gmail.com>
Date: Mon,  9 Apr 2018 17:39:28 -0300
Subject: [Buildroot] [PATCH 2/2]  linux-headers: bump 4.16.x series
In-Reply-To: <1523306368-28027-1-git-send-email-festevam@gmail.com>
References: <1523306368-28027-1-git-send-email-festevam@gmail.com>
Message-ID: <1523306368-28027-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3dcc401..40faef2 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -258,5 +258,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
 	default "4.14.33"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.16"	if BR2_KERNEL_HEADERS_4_15
-	default "4.16"		if BR2_KERNEL_HEADERS_4_16
+	default "4.16.1"	if BR2_KERNEL_HEADERS_4_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
