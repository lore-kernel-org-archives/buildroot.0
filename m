From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 23:46:52 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] linux-headers: bump 3.2.x
 and 4.{4, 9, 14, 16}.x series
Message-ID: <20180719214653.BD10C890F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=426d94916f7d3448c86838cf88f8803ac43e8f04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0326a06bea92ab67b5ac8db96f619820b5f6cf86)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b99b36e83d..07b75f5a97 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -248,15 +248,15 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.101"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.134"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.104"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.135"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.106"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.46"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.48"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
-	default "4.16.13"	if BR2_KERNEL_HEADERS_4_16
+	default "4.16.14"	if BR2_KERNEL_HEADERS_4_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
