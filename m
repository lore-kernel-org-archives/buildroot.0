From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Mar 2018 23:43:27 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.2.x and 4.{14,
 15}.x series
Message-ID: <20180322230316.450C5838A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b83a4d3d69d5daa871812bd4c4803acef789e318
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a99f0fa137..3d94ca986d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -240,7 +240,7 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.100"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.101"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.50"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.122"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.88"	if BR2_KERNEL_HEADERS_4_9
@@ -248,6 +248,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.28"	if BR2_KERNEL_HEADERS_4_14
-	default "4.15.11"	if BR2_KERNEL_HEADERS_4_15
+	default "4.14.29"	if BR2_KERNEL_HEADERS_4_14
+	default "4.15.12"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
