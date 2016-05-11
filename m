From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 May 2016 22:01:59 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.{14, 18}.x and 4.{1,
	4, 5}.x series
Message-ID: <20160511200558.772BF81E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5883703bcd840663d1afb2f618febc276f00da92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 04d5890..7c080d6 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -214,13 +214,13 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.112"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.101"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.59"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.68"	if BR2_KERNEL_HEADERS_3_14
-	default "3.18.32"	if BR2_KERNEL_HEADERS_3_18
+	default "3.14.69"	if BR2_KERNEL_HEADERS_3_14
+	default "3.18.33"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.23"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.24"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
-	default "4.4.9"		if BR2_KERNEL_HEADERS_4_4
-	default "4.5.3"		if BR2_KERNEL_HEADERS_4_5
+	default "4.4.10"	if BR2_KERNEL_HEADERS_4_4
+	default "4.5.4"		if BR2_KERNEL_HEADERS_4_5
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
