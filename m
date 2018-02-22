From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Feb 2018 23:18:10 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 9, 14,
 15}.x series
Message-ID: <20180222221859.C71B684744@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3733907f673427205288645a078691f930898333
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4762494f69..87fe0a6d38 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -242,12 +242,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.98"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.49"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.116"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.82"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.117"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.83"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.20"	if BR2_KERNEL_HEADERS_4_14
-	default "4.15.4"	if BR2_KERNEL_HEADERS_4_15
+	default "4.14.21"	if BR2_KERNEL_HEADERS_4_14
+	default "4.15.5"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
