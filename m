From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Wed, 15 Feb 2017 11:51:27 -0200
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{4, 9}.x series
In-Reply-To: <1487166687-3031-1-git-send-email-fabio.estevam@nxp.com>
References: <1487166687-3031-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <1487166687-3031-2-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b1d117a..dcdb571 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -222,7 +222,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.38"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.48"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.49"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.9"		if BR2_KERNEL_HEADERS_4_9
+	default "4.9.10"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
