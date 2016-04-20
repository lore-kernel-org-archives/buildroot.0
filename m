From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Apr 2016 13:39:24 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.{14, 18}.x and 4.{1,
	4, 5}.x series
Message-ID: <20160420114712.0086881E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c500a4f2a8e3e36013d251c2fbe1335dccc79346
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9f80224..7acbf61 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -214,13 +214,13 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.111"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.101"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.57"	if BR2_KERNEL_HEADERS_3_12
-	default "3.14.66"	if BR2_KERNEL_HEADERS_3_14
-	default "3.18.30"	if BR2_KERNEL_HEADERS_3_18
+	default "3.14.67"	if BR2_KERNEL_HEADERS_3_14
+	default "3.18.31"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.21"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.22"	if BR2_KERNEL_HEADERS_4_1
 	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
 	default "4.3.6"		if BR2_KERNEL_HEADERS_4_3
-	default "4.4.7"		if BR2_KERNEL_HEADERS_4_4
-	default "4.5.1"		if BR2_KERNEL_HEADERS_4_5
+	default "4.4.8"		if BR2_KERNEL_HEADERS_4_4
+	default "4.5.2"		if BR2_KERNEL_HEADERS_4_5
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
