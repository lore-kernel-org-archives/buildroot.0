From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Aug 2018 14:02:00 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 9, 14,
 17}.x series
Message-ID: <20180823115421.DE8F18E31C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59af8a3a223d2d5fdd6496ef59b79be38d957df5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 783cc7ea3a..adac3f6398 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -258,14 +258,14 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.150"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.122"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.151"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.123"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.65"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.66"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
-	default "4.17.17"	if BR2_KERNEL_HEADERS_4_17
+	default "4.17.18"	if BR2_KERNEL_HEADERS_4_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
