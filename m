From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Apr 2018 16:54:07 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] linux-headers: bump 4.{4,
 9, 14, 15}.x series
Message-ID: <20180406165914.076C08104E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0ec71f4d3671d1bc32ac29557a00e4dfecfdaee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d9534c816383ac45e75ae042b7c668406d9e8b1f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3a8adfd6bf..f4c1427f29 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -242,12 +242,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.101"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.50"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.123"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.89"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.124"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.90"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.29"	if BR2_KERNEL_HEADERS_4_14
-	default "4.15.12"	if BR2_KERNEL_HEADERS_4_15
+	default "4.14.30"	if BR2_KERNEL_HEADERS_4_14
+	default "4.15.13"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
