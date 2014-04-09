From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Apr 2014 13:45:13 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.{2,12}.x series
Message-ID: <20140409114632.13DFE9C6B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8b083158a5d7c80bc54697c17ab4bbbc8d65fb04
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 0919415..005ad1e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -158,7 +158,7 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
-	default "3.2.56"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.57"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.86"	if BR2_KERNEL_HEADERS_3_4
 	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
 	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
@@ -166,7 +166,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
 	default "3.10.36"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.16"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.17"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.9"	if BR2_KERNEL_HEADERS_3_13
 	default "3.14"		if BR2_KERNEL_HEADERS_3_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
