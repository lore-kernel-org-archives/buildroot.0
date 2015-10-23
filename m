From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Oct 2015 09:26:58 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.{10, 14}.x and 4.{1,
	2}.x series
Message-ID: <20151023072754.2C22D81F74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81177daef9d6026904260685c1afe50a1e4fdf19
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e05cef9..2ea5717 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -193,14 +193,14 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.72"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.110"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.90"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.91"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.49"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.54"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.55"	if BR2_KERNEL_HEADERS_3_14
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
 	default "3.18.22"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.10"	if BR2_KERNEL_HEADERS_4_1
-	default "4.2.3"		if BR2_KERNEL_HEADERS_4_2
+	default "4.1.11"	if BR2_KERNEL_HEADERS_4_1
+	default "4.2.4"		if BR2_KERNEL_HEADERS_4_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
