From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 14:25:40 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.{2, 10, 12, 14,
	18}.x and 4.1.x series
Message-ID: <20150901083106.B52E481E93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=76f881532485132e1105755aa8a23e6789baf637
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Beno??t Th??baudeau <benoit@wsystem.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index baf098a..61eca21 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -208,18 +208,18 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
-	default "3.2.69"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.70"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.108"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.85"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.86"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.45"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.46"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.49"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.50"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
-	default "3.18.19"	if BR2_KERNEL_HEADERS_3_18
+	default "3.18.20"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.4"		if BR2_KERNEL_HEADERS_4_1
+	default "4.1.5"		if BR2_KERNEL_HEADERS_4_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
