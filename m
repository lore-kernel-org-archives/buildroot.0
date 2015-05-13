From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 May 2015 21:36:00 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.{2, 10, 12, 14, 18,
	19}.x / 4.0.x stable versions
Message-ID: <20150513202017.B4F018198C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c36e122304a1d2855656e200ccbce7c475ac8a45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 47a8922..3e8956b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -198,17 +198,17 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
-	default "3.2.68"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.69"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.107"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.76"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.78"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.41"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.42"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.40"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.42"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
-	default "3.18.12"	if BR2_KERNEL_HEADERS_3_18
-	default "3.19.6"	if BR2_KERNEL_HEADERS_3_19
-	default "4.0.1"		if BR2_KERNEL_HEADERS_4_0
+	default "3.18.13"	if BR2_KERNEL_HEADERS_3_18
+	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
+	default "4.0.3"		if BR2_KERNEL_HEADERS_4_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
