From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 16:48:09 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] linux-headers: bump 4.{1,
 4, 9, 14, 16}.x series
Message-ID: <20180617150241.1F5E68832E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01ac9a17f3f2c5a13a6da69bbf92135d470a1e1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

[Peter: drop 4.16.x change]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8f038e6b30a20a387ba3c80912dd15b3d2023078)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 65e0556f88..bb5dd6dd26 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -241,13 +241,13 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.101"	if BR2_KERNEL_HEADERS_3_2
-	default "4.1.51"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.133"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.103"	if BR2_KERNEL_HEADERS_4_9
+	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
+	default "4.4.134"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.104"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.44"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.46"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
