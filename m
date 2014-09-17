From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Sep 2014 22:58:04 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.{16, 14, 10}.x series
Message-ID: <20140917205848.959D09D6CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc053f4e7070cab1cf0024da95e11c53e1666ad5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c0ddf3e..ce65f7b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -163,11 +163,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.63"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.103"	if BR2_KERNEL_HEADERS_3_4
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.54"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.55"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.28"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.18"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.19"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
-	default "3.16.2"	if BR2_KERNEL_HEADERS_3_16
+	default "3.16.3"	if BR2_KERNEL_HEADERS_3_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
