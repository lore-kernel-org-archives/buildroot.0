From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Feb 2015 22:15:15 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.{4, 10, 12, 14,
	18}.x series
Message-ID: <20150206214705.6E7CE81768@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=443386c88328280773e37ff20d5eafc789a98d6e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6be6b60..2755f2f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -173,14 +173,14 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.66"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.105"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.67"	if BR2_KERNEL_HEADERS_3_10
+	default "3.4.106"	if BR2_KERNEL_HEADERS_3_4
+	default "3.10.68"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.36"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.37"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.31"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.32"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
-	default "3.18.5"	if BR2_KERNEL_HEADERS_3_18
+	default "3.18.6"	if BR2_KERNEL_HEADERS_3_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
