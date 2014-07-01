From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 13:34:03 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.{4, 10, 14,
	15}.x series
Message-ID: <20140701114536.7226B9D128@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e0d429d88973a45eab3b8c851ed23374c602e946
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3d2094a..747d9c1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -149,12 +149,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.60"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.95"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.96"	if BR2_KERNEL_HEADERS_3_4
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.45"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.46"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.23"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.9"	if BR2_KERNEL_HEADERS_3_14
-	default "3.15.2"	if BR2_KERNEL_HEADERS_3_15
+	default "3.14.10"	if BR2_KERNEL_HEADERS_3_14
+	default "3.15.3"	if BR2_KERNEL_HEADERS_3_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
