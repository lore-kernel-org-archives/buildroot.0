From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2015 23:45:05 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.{10, 14}.x and 4.{1,
	2}.x series
Message-ID: <20151110232250.3DD6881EAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1fc783adc5db01e426713a7630ea9e589eb85806
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d2686b6..5f99cc1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -201,15 +201,15 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.72"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.110"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.92"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.93"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.50"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.56"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.57"	if BR2_KERNEL_HEADERS_3_14
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.24"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.12"	if BR2_KERNEL_HEADERS_4_1
-	default "4.2.5"		if BR2_KERNEL_HEADERS_4_2
+	default "4.1.13"	if BR2_KERNEL_HEADERS_4_1
+	default "4.2.6"		if BR2_KERNEL_HEADERS_4_2
 	default "4.3"		if BR2_KERNEL_HEADERS_4_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
