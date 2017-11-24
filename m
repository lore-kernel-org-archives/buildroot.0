From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 21:35:31 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.{2, 10}.x and 4.{1, 4,
 9, 13}.x series
Message-ID: <20171124202812.F2564814A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b7b0053131d42e7f502920eae4283f1f4f6c430
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3091100..61a9414 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -239,15 +239,15 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.94"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.95"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.107"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.108"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
-	default "4.1.45"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.100"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.64"	if BR2_KERNEL_HEADERS_4_9
+	default "4.1.46"	if BR2_KERNEL_HEADERS_4_1
+	default "4.4.102"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.65"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
-	default "4.13.15"	if BR2_KERNEL_HEADERS_4_13
+	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
