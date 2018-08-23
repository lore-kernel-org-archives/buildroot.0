From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Aug 2018 21:54:06 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] linux-headers: bump 4.{4,
 9, 14, 16, 17}.x series
Message-ID: <20180823194641.08D778E444@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a5a04906d0436c8a8be2a1534e368cee5317868
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

[Peter: drop 4.17.x change]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 30fc1bee72d95cfe535c97b07de673c2009f6b34)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8d81eabb4a..bd2519d51e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -250,13 +250,13 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.144"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.115"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.145"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.116"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.58"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.59"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
-	default "4.16.17"	if BR2_KERNEL_HEADERS_4_16
+	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
