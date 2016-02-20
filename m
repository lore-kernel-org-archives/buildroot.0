From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Feb 2016 12:08:53 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.10.x and 4.3.x series
Message-ID: <20160220110934.BEB5980AED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f8dc55f7e3ca0eb618fa41ba9d69ddb886a56bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index bdf99f5..a101935 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -209,7 +209,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.77"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.110"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.96"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.97"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.54"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.61"	if BR2_KERNEL_HEADERS_3_14
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
@@ -218,6 +218,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.18"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
-	default "4.3.5"		if BR2_KERNEL_HEADERS_4_3
+	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
 	default "4.4.2"		if BR2_KERNEL_HEADERS_4_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
