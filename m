From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 22:14:09 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.{4, 10, 13,
	14}.x series
Message-ID: <20140414204029.2968B9C786@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d91d988be805687de5ecae31bd716908e93f1a2a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 005ad1e..1c735b3 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -159,14 +159,14 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.57"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.86"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.87"	if BR2_KERNEL_HEADERS_3_4
 	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
 	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.36"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.37"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.17"	if BR2_KERNEL_HEADERS_3_12
-	default "3.13.9"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14"		if BR2_KERNEL_HEADERS_3_14
+	default "3.13.10"	if BR2_KERNEL_HEADERS_3_13
+	default "3.14.1"	if BR2_KERNEL_HEADERS_3_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
