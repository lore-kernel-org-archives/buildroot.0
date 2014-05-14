From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 May 2014 09:31:06 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.{4.10.14}.x series
Message-ID: <20140514080153.242B89CBF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad1cfef6ef5ac121dedaf514a3a990b1803c6f82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6a6a761..d1b18cf 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -146,12 +146,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.58"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.89"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.90"	if BR2_KERNEL_HEADERS_3_4
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.39"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.40"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.19"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.3"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.4"	if BR2_KERNEL_HEADERS_3_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
