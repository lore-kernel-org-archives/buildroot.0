From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Dec 2015 23:09:06 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.{10, 14}.x and 4.{1,
	2, 3}.x series
Message-ID: <20151209220919.ADD9081EF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eafbe5e676b07a2c785b2b78187261f1e997feee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6559c5e..3102ea9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -201,15 +201,15 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.74"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.110"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.93"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.94"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.51"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.57"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.58"	if BR2_KERNEL_HEADERS_3_14
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.24"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.13"	if BR2_KERNEL_HEADERS_4_1
-	default "4.2.6"		if BR2_KERNEL_HEADERS_4_2
-	default "4.3"		if BR2_KERNEL_HEADERS_4_3
+	default "4.1.14"	if BR2_KERNEL_HEADERS_4_1
+	default "4.2.7"		if BR2_KERNEL_HEADERS_4_2
+	default "4.3.1"		if BR2_KERNEL_HEADERS_4_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
