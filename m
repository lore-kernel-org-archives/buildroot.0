From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Jul 2018 14:45:27 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 9, 14, 16,
 17}.x series
Message-ID: <20180728124002.3B6158A435@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30fc1bee72d95cfe535c97b07de673c2009f6b34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-headers/Config.in.host | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index fb6140e3bc..4383466af1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -258,14 +258,14 @@ config BR2_DEFAULT_KERNEL_HEADERS
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
-	default "4.17.10"	if BR2_KERNEL_HEADERS_4_17
+	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
+	default "4.17.11"	if BR2_KERNEL_HEADERS_4_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
