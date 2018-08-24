From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 22:34:36 +0200
Subject: [Buildroot] [git commit branch/next] linux-headers: bump 4.18.x
 series
Message-ID: <20180824204817.B6BF08E20F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04277b00d1ed82c1f418d032dad647345741bcb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 67c06d3fdd..b6bc44c93e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -276,5 +276,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
 	default "4.17.18"	if BR2_KERNEL_HEADERS_4_17
-	default "4.18.3"	if BR2_KERNEL_HEADERS_4_18
+	default "4.18.5"	if BR2_KERNEL_HEADERS_4_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
