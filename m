From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Apr 2018 16:40:11 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] linux-headers: bump 3.2.x
 and 4.{1, 14, 15}.x series
Message-ID: <20180406165913.1AD1083E91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2fe1b57ef7ce845761950e42eb826de9e4d89dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cd0fd093523b558cdcf282c1d1497bc2a494f4e0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3b0bf84de1..a99f0fa137 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -240,14 +240,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.99"	if BR2_KERNEL_HEADERS_3_2
-	default "4.1.49"	if BR2_KERNEL_HEADERS_4_1
+	default "3.2.100"	if BR2_KERNEL_HEADERS_3_2
+	default "4.1.50"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.122"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.88"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.27"	if BR2_KERNEL_HEADERS_4_14
-	default "4.15.10"	if BR2_KERNEL_HEADERS_4_15
+	default "4.14.28"	if BR2_KERNEL_HEADERS_4_14
+	default "4.15.11"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
