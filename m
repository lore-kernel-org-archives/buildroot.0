From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Oct 2014 14:17:48 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.{17, 16, 14,
	10}.x series
Message-ID: <20141017121828.F1BA8B328C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8a549c75a2cd1783f94548b1a93e22f53f0f6160
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 101136a..b494885 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -171,12 +171,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.63"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.104"	if BR2_KERNEL_HEADERS_3_4
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.57"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.58"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.30"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.21"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.22"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
-	default "3.16.5"	if BR2_KERNEL_HEADERS_3_16
-	default "3.17"		if BR2_KERNEL_HEADERS_3_17
+	default "3.16.6"	if BR2_KERNEL_HEADERS_3_16
+	default "3.17.1"	if BR2_KERNEL_HEADERS_3_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
