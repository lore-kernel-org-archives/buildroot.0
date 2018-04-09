From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 22:46:09 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.16.x series
Message-ID: <20180409204644.DC986882D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b147237baae762915674078850f09b939efad1d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3dcc401eb4..40faef2281 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -258,5 +258,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
 	default "4.14.33"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.16"	if BR2_KERNEL_HEADERS_4_15
-	default "4.16"		if BR2_KERNEL_HEADERS_4_16
+	default "4.16.1"	if BR2_KERNEL_HEADERS_4_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
