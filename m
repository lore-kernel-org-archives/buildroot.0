From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 15:09:25 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 9, 14,
 18}.x series
Message-ID: <20180916131636.42B8988255@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebe0636db8119870f2cb6a48186bb14c5f20db0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e11f07f0b0..9eea914784 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -254,9 +254,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.155"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.126"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.69"	if BR2_KERNEL_HEADERS_4_14
+	default "4.4.156"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.127"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.70"	if BR2_KERNEL_HEADERS_4_14
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
-	default "4.18.7"	if BR2_KERNEL_HEADERS_4_18
+	default "4.18.8"	if BR2_KERNEL_HEADERS_4_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
