From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Jan 2015 13:26:05 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.{18, 17, 14,
	10}.x series
Message-ID: <20150109122634.8CD5A800EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d83ce6cc2e4c703f60ca429fbea4d5e413e80aa6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ed994c1..23bb201 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -174,13 +174,13 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.66"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.105"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.63"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.64"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.35"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.27"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.28"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
-	default "3.17.7"	if BR2_KERNEL_HEADERS_3_17
-	default "3.18.1"	if BR2_KERNEL_HEADERS_3_18
+	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
+	default "3.18.2"	if BR2_KERNEL_HEADERS_3_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
