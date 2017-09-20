From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Sep 2017 19:19:02 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.2.x and 4.{4, 9, 12,
	13}.x series
Message-ID: <20170920171430.BF0F780506@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4afe7a8cf54c1e989829b30ad304f23a394f770
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d30dea0..8bd3c07 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -239,15 +239,15 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.92"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.93"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.107"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.43"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.87"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.49"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.88"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.51"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
-	default "4.12.12"	if BR2_KERNEL_HEADERS_4_12
-	default "4.13.1"	if BR2_KERNEL_HEADERS_4_13
+	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
+	default "4.13.3"	if BR2_KERNEL_HEADERS_4_13
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
