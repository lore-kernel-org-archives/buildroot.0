From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 08:47:15 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.{2, 10, 14, 18,
	19}.x series
Message-ID: <20150308074731.421AB804D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=91c89a254b92625d78f1f167d8936baa89cd8fa0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e2bc05a..e6764e0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -190,16 +190,16 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
-	default "3.2.67"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.68"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.106"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.70"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.71"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.38"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.34"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.35"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
-	default "3.18.8"	if BR2_KERNEL_HEADERS_3_18
-	default "3.19"		if BR2_KERNEL_HEADERS_3_19
+	default "3.18.9"	if BR2_KERNEL_HEADERS_3_18
+	default "3.19.1"	if BR2_KERNEL_HEADERS_3_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
