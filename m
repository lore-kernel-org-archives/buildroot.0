From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2014 21:03:32 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.{2, 4, 10, 12,
	13}.x stable versions
Message-ID: <20140219203531.F176C9A547@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8b2e426239516d82a5f699675947601979982a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ea104f5..c99210d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -71,15 +71,15 @@ config BR2_DEFAULT_KERNEL_VERSION
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
-	default "3.2.54"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.79"	if BR2_KERNEL_HEADERS_3_4
+	default "3.2.55"	if BR2_KERNEL_HEADERS_3_2
+	default "3.4.80"	if BR2_KERNEL_HEADERS_3_4
 	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
 	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.29"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.30"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.10"	if BR2_KERNEL_HEADERS_3_12
-	default "3.13.2"	if BR2_KERNEL_HEADERS_3_13
+	default "3.12.11"	if BR2_KERNEL_HEADERS_3_12
+	default "3.13.3"	if BR2_KERNEL_HEADERS_3_13
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
