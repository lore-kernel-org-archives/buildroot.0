From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 21:06:02 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 9, 14,
 18}.x series
Message-ID: <20180920190554.EC3577FDB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aad44932660d6edf80016ea183e7d5b6e35dc1c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9eea914784..53f684b452 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -254,9 +254,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.156"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.127"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.70"	if BR2_KERNEL_HEADERS_4_14
+	default "4.4.157"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.128"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.71"	if BR2_KERNEL_HEADERS_4_14
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
-	default "4.18.8"	if BR2_KERNEL_HEADERS_4_18
+	default "4.18.9"	if BR2_KERNEL_HEADERS_4_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
