From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Apr 2015 23:01:20 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.{10, 14, 18,
	19}.x and 4.0 series
Message-ID: <20150429213022.5B08681D97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1df4d9598fecf0ee0f0cadcd71d7419d9676dee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e0a676d..74c1b08 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -200,15 +200,15 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.68"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.107"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.75"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.76"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.40"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.39"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.40"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
-	default "3.18.11"	if BR2_KERNEL_HEADERS_3_18
-	default "3.19.5"	if BR2_KERNEL_HEADERS_3_19
-	default "4.0"		if BR2_KERNEL_HEADERS_4_0
+	default "3.18.12"	if BR2_KERNEL_HEADERS_3_18
+	default "3.19.6"	if BR2_KERNEL_HEADERS_3_19
+	default "4.0.1"		if BR2_KERNEL_HEADERS_4_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
