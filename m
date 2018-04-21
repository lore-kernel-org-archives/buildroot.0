From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Apr 2018 14:50:24 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.9.x series
Message-ID: <20180421125128.B0EC3811F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26148a247f3757b0ee7f24b10f13c0451f25a9ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9d32687c0e..68ac47cebe 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -251,7 +251,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.101"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.51"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.128"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.94"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.95"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
