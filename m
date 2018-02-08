From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Thu, 8 Feb 2018 13:05:09 -0200
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{14, 15}.x series
In-Reply-To: <1518102309-26636-1-git-send-email-fabio.estevam@nxp.com>
References: <1518102309-26636-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <1518102309-26636-2-git-send-email-fabio.estevam@nxp.com>
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
index 069e31d..2354761 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -248,6 +248,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.17"	if BR2_KERNEL_HEADERS_4_14
-	default "4.15.1"	if BR2_KERNEL_HEADERS_4_15
+	default "4.14.18"	if BR2_KERNEL_HEADERS_4_14
+	default "4.15.2"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.7.4
