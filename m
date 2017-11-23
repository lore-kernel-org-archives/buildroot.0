From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 22:46:04 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 9, 13}.x series
Message-ID: <20171123213851.6E68F8018F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee6840166fb6ce195547cc1f9a0417ac1d611b19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5cbcbfc..3091100 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -244,10 +244,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.107"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.45"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.98"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.62"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.100"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.64"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
-	default "4.13.13"	if BR2_KERNEL_HEADERS_4_13
+	default "4.13.15"	if BR2_KERNEL_HEADERS_4_13
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
