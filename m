From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Jul 2018 21:40:37 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 9, 14,
 17}.x series
Message-ID: <20180703193748.5B1EB84397@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32899448b4a45ad52430a7de68dc36a78901d029
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ebaae8807e..0c9b1022b5 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -258,14 +258,14 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.138"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.110"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.139"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.111"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.52"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.53"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
 	default "4.16.17"	if BR2_KERNEL_HEADERS_4_16
-	default "4.17.3"	if BR2_KERNEL_HEADERS_4_17
+	default "4.17.4"	if BR2_KERNEL_HEADERS_4_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
