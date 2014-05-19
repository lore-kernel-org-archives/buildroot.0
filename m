From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 May 2014 22:00:19 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.{2,4,12}.x series
Message-ID: <20140519200727.DCDD99C1A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6e4b7775a56b70ae1b357eee0a9ae78638755b1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d1b18cf..7c688ef 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -145,13 +145,13 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
-	default "3.2.58"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.90"	if BR2_KERNEL_HEADERS_3_4
+	default "3.2.59"	if BR2_KERNEL_HEADERS_3_2
+	default "3.4.91"	if BR2_KERNEL_HEADERS_3_4
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
 	default "3.10.40"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.19"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.20"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
 	default "3.14.4"	if BR2_KERNEL_HEADERS_3_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
