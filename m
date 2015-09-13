From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Sep 2015 23:28:42 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.10.x / 3.14.x /
	4.1.x series
Message-ID: <20150913212900.A38677FA96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=91b90a168c2cf963f6c94855a2b52005f8737e87
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 49a8dc2..f4de1f2 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -193,14 +193,14 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.71"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.108"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.87"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.88"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.47"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.51"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.52"	if BR2_KERNEL_HEADERS_3_14
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.20"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.6"		if BR2_KERNEL_HEADERS_4_1
+	default "4.1.7"		if BR2_KERNEL_HEADERS_4_1
 	default "4.2"		if BR2_KERNEL_HEADERS_4_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
