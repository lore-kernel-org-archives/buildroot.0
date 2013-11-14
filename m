From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Nov 2013 12:24:42 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3. {4, 10,
	11}.x stable versions
Message-ID: <20131114112825.568749BC8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da558954b62ffcead52a102c1de26a6ca14a88aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2bd8b02..997dce4 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -83,14 +83,14 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
 	default "3.2.52"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.68"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.69"	if BR2_KERNEL_HEADERS_3_4
 	default "3.5.7"		if BR2_KERNEL_HEADERS_3_5
 	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
 	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.18"	if BR2_KERNEL_HEADERS_3_10
-	default "3.11.7"	if BR2_KERNEL_HEADERS_3_11
+	default "3.10.19"	if BR2_KERNEL_HEADERS_3_10
+	default "3.11.8"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12"		if BR2_KERNEL_HEADERS_3_12
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
