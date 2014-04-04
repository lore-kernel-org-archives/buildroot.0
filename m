From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Apr 2014 23:37:29 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.{4, 10, 12,
	13}.x series
Message-ID: <20140404213825.77B1F9C559@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2684d137aed77ed2dc7a7814ac336c9e4f316960
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 296f03e..0919415 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -159,14 +159,14 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.56"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.85"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.86"	if BR2_KERNEL_HEADERS_3_4
 	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
 	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.35"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.36"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.15"	if BR2_KERNEL_HEADERS_3_12
-	default "3.13.8"	if BR2_KERNEL_HEADERS_3_13
+	default "3.12.16"	if BR2_KERNEL_HEADERS_3_12
+	default "3.13.9"	if BR2_KERNEL_HEADERS_3_13
 	default "3.14"		if BR2_KERNEL_HEADERS_3_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
